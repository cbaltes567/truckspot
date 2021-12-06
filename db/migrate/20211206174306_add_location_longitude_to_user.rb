class AddLocationLongitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location_longitude, :float
  end
end
