class AddGarageReferenceToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :garages
    add_index :favorites, :garage_id
    change_column_null :favorites, :garage_id, false
  end
end
