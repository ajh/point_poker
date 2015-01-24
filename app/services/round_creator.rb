class RoundCreator
  attr_accessor :round

  def initialize(round)
    @round = round
  end

  def save
    round.transaction do
      round.save && game_change.save or raise ActiveRecord::Rollback
      WebsocketRails[round.game.token].trigger 'news', {game_version: round.game.lock_version}
    end
  end

  private

  def game_change
    @game_change ||= round.game
                          .game_changes
                          .build round: round,
                                 game_version: round.game.lock_version + 1,
                                 kind: 'blah'
  end
end
