class User < ApplicationRecord
  # Direct associations

  belongs_to :vehicle

  has_many   :favorites,
             :dependent => :destroy

  has_many   :reviews,
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :reservations,
             :dependent => :destroy

  # Indirect associations

  has_many   :favorite_garages,
             :through => :favorites,
             :source => :garage

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
