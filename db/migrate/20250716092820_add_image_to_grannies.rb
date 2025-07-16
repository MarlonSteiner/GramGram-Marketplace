class AddImageToGrannies < ActiveRecord::Migration[7.1]
  def change
    add_column :grannies, :image, :string
  end
end
