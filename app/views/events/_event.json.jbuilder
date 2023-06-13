json.extract! event, :id, :event_name, :event_type, :event_url, :zoom_code, :rsvp_needed, :maximum_capacity, :start_time, :end_time, :members_only, :lounge_id, :created_at, :updated_at
json.url event_url(event, format: :json)
