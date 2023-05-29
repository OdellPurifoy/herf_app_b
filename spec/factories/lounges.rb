FactoryBot.define do
  factory :lounge do
    name { "MyString" }
    phone_number { "MyString" }
    email { "MyString" }
    description { "MyText" }
    alcohol_served { false }
    food_served { false }
    outside_alcohol_allowed { false }
    outside_cigars_allowed { false }
    user { nil }
  end
end
