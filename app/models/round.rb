class Round < ActiveRecord::Base
  belongs_to :game, touch: true
end
