# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id           :uuid             not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  email        :string           not null
#  phone_number :string
#  do_not_text  :boolean
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Membership < ApplicationRecord
  belongs_to :lounge

  validates_presence_of :first_name, :last_name, :email
  validates :phone_number, phone: { possible: true }
end
