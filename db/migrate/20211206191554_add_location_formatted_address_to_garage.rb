class AddLocationFormattedAddressToGarage < ActiveRecord::Migration[6.0]
  def change
    add_column :garages, :location_formatted_address, :string
  end
end
