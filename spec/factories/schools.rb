FactoryBot.define do
    factory :school do
      name { Faker::Name.name }
      user {create(:user)}
    end
  end