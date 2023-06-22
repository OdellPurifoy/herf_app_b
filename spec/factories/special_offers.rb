# == Schema Information
#
# Table name: special_offers
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  start_date   :date             not null
#  end_date     :date             not null
#  description  :text             not null
#  members_only :boolean
#  offer_type   :string           not null
#  offer_code   :string
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :special_offer do
    name { 'BOGO Sale!' }
    start_date { Date.today + 1.day }
    end_date { Date.today + 1.week }
    description { Faker::Lorem.paragraph }
    members_only { false }
    offer_type { "BOGO (Buy one, get one)" }
    offer_code { "BOGO123" }
    lounge
  end
end
