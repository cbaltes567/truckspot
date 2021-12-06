json.extract! review, :id, :reviewer_id, :rating, :review_body, :garage_id,
              :created_at, :updated_at
json.url review_url(review, format: :json)
