class PlayCreator
  attr_accessor :play

  def initialize(play)
    @play = play
  end

  def save
    play.transaction do
      play.save && game_change.save or raise ActiveRecord::Rollback
    end
  end

  private

  def game_change
    game = play.round.game
    @game_change ||= play.round.game.game_changes.build play: play,
                                                        game_version: game.lock_version,
                                                        kind: 'blah'

  end
end
