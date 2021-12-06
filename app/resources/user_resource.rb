class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :license_plate_number, :string
  attribute :vehicle_id, :integer
  attribute :location, :string

  # Direct associations

  belongs_to :vehicle

  has_many   :favorites

  has_many   :reviews,
             foreign_key: :reviewer_id

  has_many   :reservations

  # Indirect associations

  many_to_many :favorite_garages,
               resource: GarageResource

end
