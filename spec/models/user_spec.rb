require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should not be valid without a password" do
      user = User.new password: nil, password_confirmation: nil
      user.should_not be_valid
    end

    it "should be not be valid with a short password" do
      user = User.new password: 'short', password_confirmation: 'short'
      user.should_not be_valid
    end

    it "should not be valid with a confirmation mismatch" do
      user = User.new password: 'short', password_confirmation: 'long'
      user.should_not be_valid
    end

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
end
