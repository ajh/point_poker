class PlayCreator
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def save
    play.transaction do
      if play.story.plays.length >= game.users.where(observer: false).length
        play.story.complete = true
        play.story.completed_at = Time.zone.now
      end

      play.save && game_change.save && play.story.save or raise ActiveRecord::Rollback
    end
  end

  private

  def game_change
    @game_change ||= game.game_changes.build story: play.story,
                                             game_version: game.lock_version + 1,
                                             action: 'update'
  end

  def game
    play.story.game
  end
end
