class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :license_plate_number
      t.integer :vehicle_id
      t.string :location

      t.timestamps
    end
  end
end
