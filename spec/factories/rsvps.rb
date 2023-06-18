require 'faker'

FactoryBot.define do
  factory :rsvp do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { '9008007000' }
    email { Faker::Internet.email }
    number_of_guests { 1 }
    attended { false }
    event
  end
end
