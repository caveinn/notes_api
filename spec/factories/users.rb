FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      email { Faker::Internet.email }
      password { 'merrrrrrrrr' }
      password_confirmation { 'merrrrrrrrr' }
    end
  end