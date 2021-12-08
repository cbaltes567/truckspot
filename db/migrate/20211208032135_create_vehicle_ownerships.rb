class CreateVehicleOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_ownerships do |t|
      t.integer :vehicle_id
      t.integer :owner_id
      t.string :license_plate_number

      t.timestamps
    end
  end
end
