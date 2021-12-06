class AddLocationLatitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location_latitude, :float
  end
end
