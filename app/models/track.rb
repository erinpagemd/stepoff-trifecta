class Track < ActiveRecord::Base
  validates :name, presence: true,
                   length: {minimum: 3,
                            too_short: "name should have atleast 3 characters"
                           }
  validates :distance, presence: true,
                       numericality: {
                         greater_than_or_equal_to: 0.1
                       }
  before_validation :round_distance, on: :create

  protected
  def round_distance
    unless self.distance.nil?
      self.distance = self.distance.round(1)
    end
  end
end
