class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :reviewer_id, :integer
  attribute :rating, :integer
  attribute :review_body, :string
  attribute :garage_id, :integer

  # Direct associations

  # Indirect associations

end
