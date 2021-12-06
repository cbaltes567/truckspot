class CreateVehicleTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_types do |t|
      t.string :make
      t.string :model
      t.float :width
      t.float :height

      t.timestamps
    end
  end
end
