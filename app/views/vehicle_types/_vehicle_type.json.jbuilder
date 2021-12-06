json.extract! vehicle_type, :id, :make, :model, :width, :height, :created_at,
              :updated_at
json.url vehicle_type_url(vehicle_type, format: :json)
