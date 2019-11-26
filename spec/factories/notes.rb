FactoryBot.define do
    factory :note do
      subject { Faker::Lorem.word }
      topic { Faker::Lorem.word }
      notes { Faker::Quotes::Shakespeare }
      stream { create(:stream) }
      user { create(:user) }
    end
  end