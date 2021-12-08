class AddUserReferenceToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :users
    add_index :favorites, :user_id
    change_column_null :favorites, :user_id, false
  end
end
