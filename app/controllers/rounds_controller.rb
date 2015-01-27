class RoundsController < ApplicationController
  before_action :set_game
  respond_to :json, :html

  # POST /games/:game_id/rounds
  # POST /games/:game_id/rounds.json
  def create
    @round = @game.rounds.build round_params
    round_creator = RoundCreator.new @round

    respond_to do |format|
      if round_creator.save
        format.json do
          render status: :created, location: game_round_url(@round.game, @round)
        end
        format.html do
          redirect_to game_path(@game)
        end
      else
        format.json do
          render status: :unprocessable_entity
        end
        format.html do
          raise NotImplementedError
        end
      end
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
