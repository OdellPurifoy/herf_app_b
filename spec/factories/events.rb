# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                :uuid             not null, primary key
#  event_name        :string           not null
#  event_type        :string           not null
#  event_url         :string
#  zoom_code         :string
#  rsvp_needed       :boolean          default(FALSE)
#  maximum_capacity  :integer
#  start_time        :time             not null
#  end_time          :time             not null
#  members_only      :boolean          default(FALSE)
#  lounge_id         :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_date        :date             not null
#  is_virtual        :boolean          default(FALSE)
#  event_description :text
#
FactoryBot.define do
  factory :event do
    event_name { Faker::Marketing.buzzwords } #=> "rubber meets the road", "sprint to the finish line"
    event_type { 'Live Music' }
    event_url { Faker::Internet.url }
    event_date { Date.today + 1.day }
    event_description { Faker::Lorem.paragraph }
    zoom_code { '1234567' }
    rsvp_needed { false }
    is_virtual { false }
    maximum_capacity { 25 }
    start_time { Time.zone.now + 1.day }
    end_time { (Time.zone.now + 1.day) + 4.hours }
    members_only { false }
    lounge
  end
end
