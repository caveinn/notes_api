FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      email { 'merr@merr.com' }
      password { 'merrrrrrrrr' }
      password_confirmation { 'merrrrrrrrr' }
    end
  end