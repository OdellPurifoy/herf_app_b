# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :lounge, inverse_of: :address

  validates_presence_of :address_street_1, :city, :state, :zipcode
end
