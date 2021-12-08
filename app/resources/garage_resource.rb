class GarageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :garage_name, :string
  attribute :maximum_height, :float
  attribute :maximum_width, :float
  attribute :cost_per_hour, :float
  attribute :garage_picture, :string
  attribute :location, :string

  # Direct associations

  has_many   :favorites

  has_many   :reviews

  has_many   :reservations

  # Indirect associations

  many_to_many :reviewers,
               resource: UserResource

  many_to_many :users
end
