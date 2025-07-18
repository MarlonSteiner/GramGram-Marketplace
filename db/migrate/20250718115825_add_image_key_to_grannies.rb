class AddImageKeyToGrannies < ActiveRecord::Migration[7.1]
  def change
    add_column :grannies, :image_key, :string
  end
end
