# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :lounge

  validates_presence_of :first_name, :last_name, :email
  validates :phone_number, phone: { possible: true }
end
