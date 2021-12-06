class AddVehicleReferenceToVehicleOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :vehicle_ownerships, :vehicles
    add_index :vehicle_ownerships, :vehicle_id
    change_column_null :vehicle_ownerships, :vehicle_id, false
  end
end
