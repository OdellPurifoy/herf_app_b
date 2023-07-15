json.extract! lounge, :id, :name, :phone_number, :email, :description, :alcohol_served, :food_served,
              :outside_alcohol_allowed, :outside_cigars_allowed, :user_id, :created_at, :updated_at
json.url lounge_url(lounge, format: :json)
