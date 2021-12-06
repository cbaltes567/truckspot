class GarageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :lowest_height, :float
  attribute :location, :string
  attribute :cost_per_hour, :float
  attribute :parking_spot_width, :float
  attribute :garage_picture, :string

  # Direct associations

  # Indirect associations

end