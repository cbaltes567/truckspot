class VehicleOwnership < ApplicationRecord
  # Direct associations

  belongs_to :vehicle

  belongs_to :owner,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    vehicle.to_s
  end
end
