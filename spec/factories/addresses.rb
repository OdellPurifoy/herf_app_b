# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address_street_1 { Faker::Address.street_name }
    address_street_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.postcode }
    lounge
  end
end
