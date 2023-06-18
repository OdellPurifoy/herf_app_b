# frozen_string_literal: true

class Rsvp < ApplicationRecord
  belongs_to :event

  validates_presence_of :first_name, :last_name
  validates :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
