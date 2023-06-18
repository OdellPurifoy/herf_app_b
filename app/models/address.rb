# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :uuid             not null, primary key
#  address_street_1 :string           not null
#  address_street_2 :string
#  city             :string           not null
#  state            :string           not null
#  zipcode          :string           not null
#  lounge_id        :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :lounge, inverse_of: :address

  validates_presence_of :address_street_1, :city, :state, :zipcode
  validates_format_of :zipcode,
                      with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                      message: 'should be 12345 or 12345-1234'
end
