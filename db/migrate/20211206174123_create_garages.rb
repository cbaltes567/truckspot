class CreateGarages < ActiveRecord::Migration[6.0]
  def change
    create_table :garages do |t|
      t.float :lowest_height
      t.string :location
      t.float :cost_per_hour
      t.float :parking_spot_width
      t.string :garage_picture

      t.timestamps
    end
  end
end
