json.extract! user, :id, :license_plate_number, :vehicle_id, :location,
              :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt
