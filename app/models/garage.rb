class Garage < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :lowest_height, :numericality => { :greater_than => 0 }

  validates :parking_spot_width, :presence => true

  validates :parking_spot_width, :numericality => { :greater_than => 0 }

  # Scopes

  def to_s
    lowest_height
  end

end
