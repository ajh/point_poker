class ChannelTestsController < ApplicationController

  # GET /channel/:game_id
  def channel
    @game = Game.find_by_token!(params[:game_id])
    WebsocketRails[@game.token].trigger 'news', {hi: 'hi'}
    render nothing: true
  end
end
