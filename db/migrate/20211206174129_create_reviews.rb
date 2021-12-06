class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :rating
      t.string :review_body
      t.integer :garage_id

      t.timestamps
    end
  end
end
