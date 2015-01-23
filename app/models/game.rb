class Game < ActiveRecord::Base
  before_create :generate_token
  has_many :users

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
