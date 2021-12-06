require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  
  include JwtToken
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

  has_many   :garage_reviews,
             :through => :reviews,
             :source => :garage

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
