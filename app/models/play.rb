# == Schema Information
#
# Table name: plays
#
#  id         :integer          not null, primary key
#  story_id   :integer          not null
#  user_id    :integer          not null
#  value      :decimal(5, 3)    not null
#  created_at :datetime
#  updated_at :datetime
#  user_name  :string(255)      not null
#

class Play < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  VALUES = [1,2,3,5,8,13,21,100].freeze
end
