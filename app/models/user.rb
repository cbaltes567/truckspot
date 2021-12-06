class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :license_plate_number, :presence => true

  validates :location, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
