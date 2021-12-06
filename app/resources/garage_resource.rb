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

  has_many   :favorites

  has_many   :reviews

  has_many   :reservations

  # Indirect associations

  many_to_many :users

end
