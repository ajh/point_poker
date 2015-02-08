class PlayCreator
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def save
    play.transaction do
      if play.story.plays.length >= game.users.where(observer: false).length
        play.story.complete = true
        play.save && story_game_change.save && play.story.save or raise ActiveRecord::Rollback

      else
        play.save && play_game_change.save or raise ActiveRecord::Rollback
      end
    end
  end

  private

  def play_game_change
    @play_game_change ||= game.game_changes.build play: play,
                                             game_version: game.lock_version + 1,
                                             action: 'create'
  end

  def story_game_change
    @story_game_change ||= game.game_changes.build story: play.story,
                                             game_version: game.lock_version + 1,
                                             action: 'update'
  end

  def game
    play.story.game
  end
end
