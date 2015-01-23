class RoundsController < ApplicationController
  before_action :set_game

  # POST /games/:game_id/rounds
  # POST /games/:game_id/rounds.json
  def create
    @round = @game.rounds.build round_params

    respond_to do |format|
      if @round.save
        format.html { redirect_to @game, notice: "Round created: #{@round.description}" }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
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
