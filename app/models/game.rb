class Game < ActiveRecord::Base
  before_create :generate_token
  has_many :game_changes, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :users, dependent: :destroy

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
