class Story < ActiveRecord::Base
  belongs_to :game, touch: true
  has_many :plays, dependent: :destroy

  # Return string representing average mean of all plays
  def mean
    plays.any? or return 'undefined'
    self.class.mean plays.map(&:value)
  end

  def std_dev
    plays.any? or return 'undefined'
    self.class.standard_deviation plays.map(&:value)
  end

  def coefficient_of_variation
    plays.any? or return 'undefined'
    std_dev.to_f / mean.to_f
  end

  def duration
    completed_at - created_at
  end

  # Math stuff. Could be moved somewhere else. Taken from
  # http://stackoverflow.com/questions/7749568/how-can-i-do-standard-deviation-in-ruby

  def self.sum(a)
    a.inject(0){ |accum, i| accum + i }
  end

  def self.mean(a)
    sum(a) / a.length.to_f
  end

  def self.sample_variance(a)
    m = mean(a)
    sum = a.inject(0){ |accum, i| accum + (i - m) ** 2 }
    sum / (a.length - 1).to_f
  end

  def self.standard_deviation(a)
    Math.sqrt(sample_variance(a))
  end
end
