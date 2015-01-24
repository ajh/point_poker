class PlayCreator
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def save
    play.transaction do
      play.save && game_change.save or raise ActiveRecord::Rollback
      WebsocketRails[game.token].trigger 'news', {game_version: game.lock_version}
    end
  end

  private

  def game_change
    @game_change ||= game.game_changes.build play: play,
                                             game_version: game.lock_version + 1,
                                             kind: 'blah'
  end

  def game
    play.round.game
  end
end
