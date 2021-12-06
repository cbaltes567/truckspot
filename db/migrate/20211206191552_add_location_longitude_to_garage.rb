class AddLocationLongitudeToGarage < ActiveRecord::Migration[6.0]
  def change
    add_column :garages, :location_longitude, :float
  end
end
