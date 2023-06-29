# frozen_string_literal: true

# == Schema Information
#
# Table name: special_offers
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  start_date   :date             not null
#  end_date     :date             not null
#  description  :text             not null
#  members_only :boolean
#  offer_type   :string           not null
#  offer_code   :string
#  lounge_id    :uuid             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class SpecialOffer < ApplicationRecord
  OFFER_TYPES = ['BOGO (Buy one, get one)', 'Holiday', 'Brand Discount', 'General Discont'].freeze

  belongs_to :lounge

  has_one_attached :flyer

  validates_presence_of :name, :start_date, :end_date, :description, :offer_type

  paginates_per 10

  def self.search(search)
    where("name LIKE ?", search + "%") if search
  end
end
