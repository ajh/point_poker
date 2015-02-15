class Play < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  VALUES = [1,2,3,5,8,13,21,100].freeze
end
