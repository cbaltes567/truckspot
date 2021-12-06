require "open-uri"
class Garage < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :garage_picture, GaragePictureUploader

  # Direct associations

  has_many   :favorites,
             dependent: :destroy

  has_many   :reviews,
             dependent: :destroy

  has_many   :reservations,
             dependent: :destroy

  # Indirect associations

  has_many   :reviewers,
             through: :reviews,
             source: :reviewer

  has_many   :users,
             through: :favorites,
             source: :user

  # Validations

  validates :cost_per_hour, presence: true

  validates :cost_per_hour, numericality: { greater_than: 0 }

  validates :location, presence: true

  validates :lowest_height, presence: true

  validates :lowest_height, numericality: { greater_than: 0 }

  validates :parking_spot_width, presence: true

  validates :parking_spot_width, numericality: { greater_than: 0 }

  # Scopes

  def to_s
    lowest_height
  end
end
