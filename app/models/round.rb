class Round < ActiveRecord::Base
  belongs_to :game, touch: true
  has_many :plays, dependent: :destroy

  def complete?
    # This is just for testing
    plays.length >= 5 or return false

    plays.length >= game.users.length
  end
end
