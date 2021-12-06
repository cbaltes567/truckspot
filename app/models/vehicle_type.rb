class VehicleType < ApplicationRecord
  # Direct associations

  has_many   :owners,
             class_name: "VehicleOwnership",
             foreign_key: "vehicle_id",
             dependent: :nullify

  # Indirect associations

  # Validations

  validates :height, presence: true

  validates :height, numericality: { greater_than: 0 }

  validates :width, presence: true

  validates :width, numericality: { greater_than: 0 }

  # Scopes

  def to_s
    make
  end
end
