class AddLocationLatitudeToGarage < ActiveRecord::Migration[6.0]
  def change
    add_column :garages, :location_latitude, :float
  end
end
