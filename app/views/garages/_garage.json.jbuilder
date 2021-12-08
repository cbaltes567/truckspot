json.extract! garage, :id, :garage_name, :maximum_height, :maximum_width,
              :cost_per_hour, :garage_picture, :location, :created_at, :updated_at
json.url garage_url(garage, format: :json)
