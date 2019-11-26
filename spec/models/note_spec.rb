require 'rails_helper'

# Test suite for the Notes model
RSpec.describe Note, type: :model do
   # Association test
  it { should belong_to(:stream) }
  it { should belong_to(:user) }

  # Validation test
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:notes) }
  
end