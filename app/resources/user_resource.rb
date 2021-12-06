class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :vehicles,
             resource: VehicleOwnershipResource,
             foreign_key: :owner_id

  has_many   :favorites

  has_many   :reviews,
             foreign_key: :reviewer_id

  has_many   :reservations

  # Indirect associations

  many_to_many :garage_reviews,
               resource: GarageResource

  many_to_many :favorite_garages,
               resource: GarageResource
end
