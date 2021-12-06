class AddGarageReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :garages
    add_index :reviews, :garage_id
    change_column_null :reviews, :garage_id, false
  end
end
