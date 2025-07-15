class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :granny, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :comment
      t.float :rating

      t.timestamps
    end
  end
end
