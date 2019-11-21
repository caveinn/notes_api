require 'rails_helper'

RSpec.describe School, type: :model do
  let(:user){create(:user)}
  describe "validations" do
    it "should  not be valid without a name" do
      school = School.new name: nil
      school.should_not be_valid
    end
    it "should not be valid if no user" do
      school = School.new name: "sample", user: nil
      school.should_not be_valid
    end
    it "should be valid if  both user and name provided" do
      school = School.new name:"sample", user: user
      school.should be_valid
    end
  end
end
