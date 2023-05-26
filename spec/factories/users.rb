require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    phone_number { '9008007000' }
  end
end
