# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  integer_id             :bigint
#  first_name             :string           not null
#  last_name              :string           not null
#  date_of_birth          :date             not null
#  username               :string           not null
#  phone_number           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  id                     :uuid             not null, primary key
#
require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    phone_number { '9008007000' }
  end
end
