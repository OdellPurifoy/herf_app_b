# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id                :uuid             not null, primary key
#  event_name        :string           not null
#  event_type        :string           not null
#  event_url         :string
#  zoom_code         :string
#  rsvp_needed       :boolean          default(FALSE)
#  maximum_capacity  :integer
#  start_time        :time             not null
#  end_time          :time             not null
#  members_only      :boolean          default(FALSE)
#  lounge_id         :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_date        :date             not null
#  is_virtual        :boolean          default(FALSE)
#  event_description :text
#
class Event < ApplicationRecord
  belongs_to :lounge
  has_many :rsvps, dependent: :destroy

  has_one_attached :flyer
  validates_presence_of :event_name, :event_type, :start_time, :end_time, :event_date
  validates :event_url, url: true, if: proc { |event| event.is_virtual }
  validates :event_description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  paginates_per 10
end
