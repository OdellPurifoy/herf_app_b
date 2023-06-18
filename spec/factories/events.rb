# frozen_string_literal: true

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
