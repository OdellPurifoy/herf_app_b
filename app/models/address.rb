# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :lounge, inverse_of: :address

  validates_presence_of :address_street_1, :city, :state, :zipcode
  validates_format_of :zipcode,
                      with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                      message: 'should be 12345 or 12345-1234'
end
