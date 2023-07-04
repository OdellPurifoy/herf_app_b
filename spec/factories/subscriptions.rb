# frozen_string_literal: true

# == Schema Information
#
# Table name: subscriptions
#
#  id                   :uuid             not null, primary key
#  current_period_end   :datetime
#  current_period_start :datetime
#  plan_interval        :string
#  status               :string
#  customer_id          :string
#  plan_id              :string
#  subscription_id      :string
#  user_id              :uuid             not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :subscription do
    customer_id { "cus_#{SecureRandom.hex(14)}" }
    current_period_start { '2023-06-12 16:34:06' }
    current_period_end { '2023-07-12 16:34:06' }
    plan_id { "price_#{SecureRandom.hex(24)}" }
    plan_interval { %w[month year].sample }
    status { 'Active' }
    subscription_id { "sub_#{SecureRandom.hex(24)}" }
    user
  end
end
