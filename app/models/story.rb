class Story < ActiveRecord::Base
  belongs_to :game, touch: true
  has_many :plays, dependent: :destroy

  # Return string representing average mean of all plays
  def mean
    plays.any? or return 'undefined'

    sum = plays.inject(0) {|s, p| s + p.value}
    mean = sum.to_f / plays.length.to_f

    "%.1f" % mean
  end
end
