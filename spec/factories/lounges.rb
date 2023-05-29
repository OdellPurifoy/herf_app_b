# frozen_string_literal: true

FactoryBot.define do
  factory :lounge do
    name { "#{Faker::Name.first_name}s_Lounge" }
    phone_number { Faker::PhoneNumber.cell_phone } #=> "(186)285-7925"
    email { "#{name}_#{phone_number}@example.com" }
    description { Faker::Lorem.sentence(word_count: 50) }
    alcohol_served { false }
    food_served { false }
    outside_alcohol_allowed { false }
    outside_cigars_allowed { false }
    user
  end
end
