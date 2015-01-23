class GameChangesController < ApplicationController
  before_action :set_game

  # GET /games/1/since/14.json
  def since

  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end
end
