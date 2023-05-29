# frozen_string_literal: true

class Lounge < ApplicationRecord
  belongs_to :user
  has_one_attached :logo

  validates_presence_of :name, :phone_number, :description
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
end
