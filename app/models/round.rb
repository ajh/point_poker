class Round < ActiveRecord::Base
  belongs_to :game, touch: true
  has_many :plays, dependent: :destroy

  def complete?
    plays.length >= game.users.length
  end
end
