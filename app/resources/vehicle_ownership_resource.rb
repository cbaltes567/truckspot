class VehicleOwnershipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :vehicle_id, :integer
  attribute :owner_id, :integer
  attribute :license_plate_number, :string

  # Direct associations

  belongs_to :vehicle_type,
             foreign_key: :vehicle_id

  belongs_to :owner,
             resource: UserResource

  # Indirect associations
end
