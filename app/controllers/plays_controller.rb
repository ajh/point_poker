class PlaysController < ApplicationController
  before_action :set_game
  before_action :set_round

  # POST /games/:game_id/rounds/:round_id/plays
  # POST /games/:game_id/rounds/:round_id/plays.json
  def create
    @play = @round.plays.build play_params.merge(user_id: session[:user_id])
    play_creator = PlayCreator.new @play

    respond_to do |format|
      if play_creator.save
        format.html { redirect_to @game, notice: 'play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
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
