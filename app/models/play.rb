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
# Indexes
#
#  index_plays_on_story_id              (story_id)
#  index_plays_on_user_id_and_story_id  (user_id,story_id) UNIQUE
#

class Play < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :story, presence: true
  validates :value, presence: true
  validates :user_name, presence: true
  validates :user, uniqueness: { scope: :story_id }

  VALUES = [0, 0.5, 1,2,3,5,8,13,21,100].freeze

  # Return value with decimal part if integer
  def value
    v = read_attribute :value
    v.floor == v ? v.floor : v
  end
end
