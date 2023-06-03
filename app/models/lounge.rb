# frozen_string_literal: true

class Lounge < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy, inverse_of: :lounge
  accepts_nested_attributes_for :address

  has_one_attached :logo
  has_many_attached :display_images

  validates_presence_of :name, :phone_number, :description
  validates :phone_number, phone: { possible: true }
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
end
