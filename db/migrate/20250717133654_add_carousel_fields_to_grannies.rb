class AddCarouselFieldsToGrannies < ActiveRecord::Migration[7.0]
  def change
    add_column :grannies, :category, :string
    add_column :grannies, :stats_speed, :integer
    add_column :grannies, :stats_health, :integer
    add_column :grannies, :stats_wisdom, :integer
    add_column :grannies, :stats_teeth, :integer
    add_column :grannies, :superhost, :boolean, default: false
    add_column :grannies, :rating, :integer
    add_column :grannies, :review_count, :integer, default: 0
    add_column :grannies, :age, :integer
  end
end
