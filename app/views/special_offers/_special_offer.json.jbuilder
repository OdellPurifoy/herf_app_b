json.extract! special_offer, :id, :name, :start_date, :end_date, :description, :members_only, :offer_type, :offer_code, :lounge_id, :created_at, :updated_at
json.url special_offer_url(special_offer, format: :json)
