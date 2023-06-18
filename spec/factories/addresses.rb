# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :uuid             not null, primary key
#  address_street_1 :string           not null
#  address_street_2 :string
#  city             :string           not null
#  state            :string           not null
#  zipcode          :string           not null
#  lounge_id        :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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
