class VehicleTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :make, :string
  attribute :model, :string
  attribute :width, :float
  attribute :height, :float

  # Direct associations

  has_many   :owners,
             resource: VehicleOwnershipResource,
             foreign_key: :vehicle_id

  # Indirect associations
end
