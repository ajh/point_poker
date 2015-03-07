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

class User < ActiveRecord::Base
  belongs_to :game, touch: true
end
