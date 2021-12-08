class Review < ApplicationRecord
  # Direct associations

  belongs_to :garage

  belongs_to :reviewer,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :rating, presence: true

  validates :rating,
            numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  validates :review_body, presence: true

  # Scopes

  def to_s
    reviewer.to_s
  end
end
