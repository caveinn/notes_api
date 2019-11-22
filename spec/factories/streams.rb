FactoryBot.define do
  factory :stream do
    name { Faker::Lorem.word }
    school_id nil
  end
end