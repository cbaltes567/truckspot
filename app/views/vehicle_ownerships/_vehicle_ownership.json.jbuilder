json.extract! vehicle_ownership, :id, :vehicle_id, :owner_id,
              :license_plate_number, :created_at, :updated_at
json.url vehicle_ownership_url(vehicle_ownership, format: :json)
