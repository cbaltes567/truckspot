class Garage < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  has_many   :reservations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :cost_per_hour, :presence => true

  validates :cost_per_hour, :numericality => { :greater_than => 0 }

  validates :location, :presence => true

  validates :lowest_height, :presence => true

  validates :lowest_height, :numericality => { :greater_than => 0 }

  validates :parking_spot_width, :presence => true

  validates :parking_spot_width, :numericality => { :greater_than => 0 }

  # Scopes

  def to_s
    lowest_height
  end

end
