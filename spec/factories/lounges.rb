# frozen_string_literal: true

# == Schema Information
#
# Table name: lounges
#
#  id                      :uuid             not null, primary key
#  name                    :string           not null
#  phone_number            :string           not null
#  email                   :string
#  description             :text             not null
#  alcohol_served          :boolean          default(FALSE)
#  food_served             :boolean          default(FALSE)
#  outside_alcohol_allowed :boolean          default(FALSE)
#  outside_cigars_allowed  :boolean          default(FALSE)
#  user_id                 :uuid             not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
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
