# frozen_string_literal: true

class Lounge < ApplicationRecord
  belongs_to :user
  has_one_attached :logo
  has_many_attached :display_images

  validates_presence_of :name, :phone_number, :description
  validates :phone_number, phone: { possible: true }
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
end
