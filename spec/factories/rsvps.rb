FactoryBot.define do
  factory :rsvp do
    first_name { "MyString" }
    last_name { "MyString" }
    phone_number { "MyString" }
    email { "MyString" }
    number_of_guests { 1 }
    attended { false }
    event { nil }
  end
end
