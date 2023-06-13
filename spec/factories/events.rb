FactoryBot.define do
  factory :event do
    event_name { "MyString" }
    event_type { "MyString" }
    event_url { "MyString" }
    zoom_code { "MyString" }
    rsvp_needed { false }
    maximum_capacity { 1 }
    start_time { "2023-06-12 20:47:35" }
    end_time { "2023-06-12 20:47:35" }
    members_only { false }
    lounge { nil }
  end
end
