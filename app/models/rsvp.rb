# frozen_string_literal: true

# == Schema Information
#
# Table name: rsvps
#
#  id               :uuid             not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string
#  email            :string
#  number_of_guests :integer
#  attended         :boolean
#  event_id         :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Rsvp < ApplicationRecord
  belongs_to :event

  validates_presence_of :first_name, :last_name
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
