require 'rails_helper'

RSpec.describe Stream, type: :model do

  describe 'associations' do
    it { should belong_to(:school) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
