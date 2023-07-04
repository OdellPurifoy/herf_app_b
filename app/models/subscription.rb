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
class Subscription < ApplicationRecord
  belongs_to :user

  validates_presence_of :current_period_start, :current_period_end, :plan_interval, :status, :customer_id, :plan_id,
                        :subscription_id
end
