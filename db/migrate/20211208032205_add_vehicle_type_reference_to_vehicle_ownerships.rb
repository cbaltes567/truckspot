class AddVehicleTypeReferenceToVehicleOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :vehicle_ownerships, :vehicle_types, column: :vehicle_id
    add_index :vehicle_ownerships, :vehicle_id
    change_column_null :vehicle_ownerships, :vehicle_id, false
  end
end
