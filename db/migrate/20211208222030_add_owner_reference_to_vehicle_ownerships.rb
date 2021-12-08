class AddOwnerReferenceToVehicleOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :vehicle_ownerships, :users, column: :owner_id
    add_index :vehicle_ownerships, :owner_id
    change_column_null :vehicle_ownerships, :owner_id, false
  end
end
