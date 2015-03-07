# == Schema Information
#
# Table name: game_changes
#
#  id           :integer          not null, primary key
#  game_id      :integer          not null
#  game_version :integer          not null
#  action       :string(255)      not null
#  play_id      :integer
#  story_id     :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

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
