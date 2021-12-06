class AddGarageReferenceToReservations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reservations, :garages
    add_index :reservations, :garage_id
    change_column_null :reservations, :garage_id, false
  end
end
