json.extract! garage, :id, :lowest_height, :location, :cost_per_hour,
              :parking_spot_width, :garage_picture, :garage_name, :created_at, :updated_at
json.url garage_url(garage, format: :json)
