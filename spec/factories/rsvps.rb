# == Schema Information
#
# Table name: rsvps
#
#  id               :uuid             not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string
#  email            :string
#  number_of_guests :integer
#  attended         :boolean
#  event_id         :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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
