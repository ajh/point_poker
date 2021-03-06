# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  token         :string(255)      not null
#  events_count  :integer
#  stories_count :integer
#  users_count   :integer
#  lock_version  :integer          default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_games_on_token  (token) UNIQUE
#

class Game < ActiveRecord::Base
  has_many :game_changes, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :users, dependent: :destroy

  before_validation :generate_token, on: :create
  validates :name, presence: true
  validates :token, presence: true

  def to_param
    token
  end

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end
