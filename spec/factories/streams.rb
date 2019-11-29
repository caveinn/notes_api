FactoryBot.define do
  factory :stream do
    name { Faker::Lorem.word }
    school { create(:school) }
  end
end