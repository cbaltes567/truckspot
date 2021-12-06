class Reservation < ApplicationRecord
  # Direct associations

  belongs_to :garage

  belongs_to :user

  # Indirect associations

  # Validations

  validates :start_date, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
