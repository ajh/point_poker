class PlayCreator
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def save
    play.transaction do
      game_change = if play.round.complete?
                      round_game_change
                    else
                      play_game_change
                    end

      play.save && game_change.save or raise ActiveRecord::Rollback
      WebsocketRails[game.token].trigger 'news', {game_version: game.lock_version}
    end
  end

  private

  def play_game_change
    @play_game_change ||= game.game_changes.build play: play,
                                             game_version: game.lock_version + 1,
                                             action: 'create'
  end

  def round_game_change
    @round_game_change ||= game.game_changes.build round: play.round,
                                             game_version: game.lock_version + 1,
                                             action: 'update'
  end

  def game
    play.round.game
  end
end
