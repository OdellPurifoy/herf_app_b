# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :lounge

  validates_presence_of :event_name, :event_type, :start_time, :end_time, :event_date
end
