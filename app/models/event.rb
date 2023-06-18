# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :lounge

  has_one_attached :flyer
  validates_presence_of :event_name, :event_type, :start_time, :end_time, :event_date
  validates :event_url, url: true, if: proc { |event| event.is_virtual }
  validates :event_description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }
end
