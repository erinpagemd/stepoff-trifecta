class Track < ActiveRecord::Base
  validates :name, presence: true,
                   length: {minimum: 3,
                            too_short: "name should have atleast 3 characters"
                           },
                   uniqueness: true
  validates :distance, presence: true,
                       numericality: {
                         greater_than_or_equal_to: 0.1
                       }
  validates :outdoor, inclusion: { in: [true, false] }
  before_save :round_distance

  protected
  def round_distance
    unless self.distance.nil?
      self.distance = self.distance.round(1)
    end
  end
end
