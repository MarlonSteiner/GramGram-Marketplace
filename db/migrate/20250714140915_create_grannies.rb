class CreateGrannies < ActiveRecord::Migration[7.1]
  def change
    create_table :grannies do |t|
      t.string :name
      t.text :bio
      t.integer :price
      t.string :location
      t.boolean :available

      t.timestamps
    end
  end
end
