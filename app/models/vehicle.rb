class Vehicle < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :width, :presence => true

  validates :width, :numericality => { :greater_than => 0 }

  # Scopes

  def to_s
    make
  end

end
