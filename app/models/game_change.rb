class GameChange < ActiveRecord::Base
  belongs_to :game, touch: true
  belongs_to :round
  belongs_to :user
  belongs_to :play
end
