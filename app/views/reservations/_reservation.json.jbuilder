json.extract! reservation, :id, :user_id, :garage_id, :start_time, :end_time,
              :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
