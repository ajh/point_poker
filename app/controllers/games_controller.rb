class GamesController < ApplicationController
  before_action :set_game, only: [:show]
  before_action :set_user_or_redirect, only: [:show]

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_game
    @game = Game.find_by_token!(params[:id])
  end

  def set_user_or_redirect
    @user = @game.users.find_by_id session[:user_id]
    @user or redirect_to new_game_user_path @game, @user
  end

  def game_params
    params.require(:game).permit(:name)
  end
end
