require 'rails_helper'

RSpec.describe Track, type: :model do
  describe "validations" do
    it "should be invalid without a name" do
      described_class.new(name: nil, distance: 0.5).should_not be_valid
    end
    it "should be invalid if name is all whitespace" do
      described_class.new(name: "         ", distance: 0.5).should_not be_valid
    end
    it "should be invalid if name is <= 2 chars" do
      described_class.new(name: "tu", distance: 0.5).should_not be_valid
    end
    it "should be invalid without a distance" do
      described_class.new(name: "Road Way 5", distance: nil).should_not be_valid
    end
    it "should have unique names"
    it "should round distances to the nearest tenth" do
      track1 = described_class.new(name: "Road Way 5", distance: 0.26)
      track1.save
      track1.distance.should eq(0.3)
    end
    it "should be invalid if distance is < 0.1" do
      described_class.new(name: "Road Way 5", distance: -0.5).should_not be_valid
    end
  end
  it "should have a factory"
end
