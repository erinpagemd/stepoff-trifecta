require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "should be invalid if name is nil"
    it "should be invalid if name too short"
    it "should be invalid if email is nil"
    it "should be invalid if email is not formatted correctly"
    it "should have a working factory"
    it "should have a secure password"
    it "should be invalid if password is empty"
  end
end
