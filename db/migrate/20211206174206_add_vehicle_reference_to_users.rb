class AddVehicleReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :vehicles
    add_index :users, :vehicle_id
    change_column_null :users, :vehicle_id, false
  end
end
