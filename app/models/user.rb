# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  game_id      :integer          not null
#  name         :string(255)      not null
#  lock_version :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#  observer     :boolean          default(FALSE), not null
#
# Indexes
#
#  index_users_on_game_id_and_name  (game_id,name) UNIQUE
#

class User < ActiveRecord::Base
  belongs_to :game, touch: true

  validates :game, presence: true
  validates :name, presence: true, uniqueness: { scope: :game_id }
end
