class GameChangesController < ApplicationController
  before_action :set_game
  respond_to :json

  # GET /games/:game_id/since/:version.json
  def since
    @game_changes = @game.game_changes
                         .where('game_version > ?', params[:version])
                         .order('game_version asc')
  end

  private

  def set_game
    @game = Game.find_by_token(params[:game_id])
  end
end
