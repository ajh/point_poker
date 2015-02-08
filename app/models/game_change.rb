class GameChange < ActiveRecord::Base
  belongs_to :game, touch: true
  belongs_to :story
  belongs_to :user
  belongs_to :play

  after_commit :start_spreading_the_news

  def start_spreading_the_news
    WebsocketRails[game.token].trigger 'news', {game_version: game.lock_version}
  end
end
