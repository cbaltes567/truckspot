class Reservation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start_date, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
