require 'rails_helper'

RSpec.describe Track, type: :model do
  describe "validations" do
    it "should be invalid without a name"
    it "should be invalid if name is all whitespace"
    it "should be invalid if name is less than 1 chars"
    it "should be invalid without a distance"
    it "should have unique names"
  end
  it "should have a factory"
end
