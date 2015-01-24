class RoundsController < ApplicationController
  before_action :set_game
  respond_to :json

  # POST /games/:game_id/rounds
  # POST /games/:game_id/rounds.json
  def create
    @round = @game.rounds.build round_params
    round_creator = RoundCreator.new @round

    if round_creator.save
      render status: :created, location: game_round_url(@round.game, @round)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end

  def round_params
    params.require(:round).permit(:description)
  end
end
