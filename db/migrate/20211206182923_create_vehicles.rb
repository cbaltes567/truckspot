class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
