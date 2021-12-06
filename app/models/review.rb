class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rating, :presence => true

  validates :rating, :numericality => true

  validates :review_body, :presence => true

  # Scopes

  def to_s
    reviewer.to_s
  end

end
