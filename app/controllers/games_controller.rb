# # Some notes:
#
# I want to subscribe to a channel with the same name as the game.
#
# I can expect various things like:
#
# * a new round was created
# * a card was chosen for a round
#
# # When I get the event, how do I refresh the UI?
#
# * I could refresh the page (awkward)
# * I use an eventual consistency strategy
#
# # Eventual consistency
#
# Each game could represent its changes by a GameChange
# object. Each change could have a number. Not sure how to
# implement this number. But assume that I can.
#
# A GameChange gets created when:
#
# * someone chooses a card for a round
# * someone creates a round
# * etc
#
# The client gets notified of the game change along with the
# number.
#
# The client compares that change number with one they're
# currently storing. If:
#
# 1. the websocket number is +1 from the stored number, then request the show json for the thing which'll have html in it and render it on the page.
# 2. the websocket number is more than +1, then ask for the missed changes before processing the current one.
#
# # Another try at Eventual consistency
#
# The client stores the lock_version value of the game. Websocket events just
# send new lock_version values. The client asks for json that includes all the
# new stuff since its known lock version, and iterates through that and renders
# it on the page.
#
# Problems:
#
# Q: How does the server determine "what is new" based on a lock version?
# A1: the GameChange could record the Game's lock_version.
#
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
