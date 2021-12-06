class AddUserReferenceToReservations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reservations, :users
    add_index :reservations, :user_id
    change_column_null :reservations, :user_id, false
  end
end
