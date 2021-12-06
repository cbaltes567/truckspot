class VehicleOwnership < ApplicationRecord
  # Direct associations

  belongs_to :vehicle_type,
             foreign_key: "vehicle_id"

  belongs_to :owner,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    vehicle_type.to_s
  end
end
