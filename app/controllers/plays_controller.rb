class PlaysController < ApplicationController
  before_action :set_game
  before_action :set_round

  respond_to :json

  # POST /games/:game_id/rounds/:round_id/plays
  # POST /games/:game_id/rounds/:round_id/plays.json
  def create
    @play = @round.plays.build play_params.merge(user_id: session[:user_id])
    play_creator = PlayCreator.new @play

    if play_creator.save
      render status: :created, location: game_round_play_url(@play.round.game, @play.round, @play)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end

  def set_round
    @round = @game.rounds.find params[:round_id]
  end

  def play_params
    params.require(:play).permit(:value)
  end
end
