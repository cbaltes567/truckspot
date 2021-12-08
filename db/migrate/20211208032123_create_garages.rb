class CreateGarages < ActiveRecord::Migration[6.0]
  def change
    create_table :garages do |t|
      t.string :garage_name
      t.float :maximum_height
      t.float :maximum_width
      t.float :cost_per_hour
      t.string :garage_picture
      t.string :location

      t.timestamps
    end
  end
end
