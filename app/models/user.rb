class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :vehicles,
             class_name: "VehicleOwnership",
             foreign_key: "owner_id",
             dependent: :destroy

  has_many   :favorites,
             dependent: :destroy

  has_many   :reviews,
             foreign_key: "reviewer_id",
             dependent: :destroy

  has_many   :reservations,
             dependent: :destroy

  # Indirect associations

  has_many   :garage_reviews,
             through: :reviews,
             source: :garage

  has_many   :favorite_garages,
             through: :favorites,
             source: :garage

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
