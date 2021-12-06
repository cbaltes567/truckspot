class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :garage_id
      t.datetime :start_date
      t.time :end_time

      t.timestamps
    end
  end
end
