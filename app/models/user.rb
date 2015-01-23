class User < ActiveRecord::Base
  belongs_to :game, touch: true
end
