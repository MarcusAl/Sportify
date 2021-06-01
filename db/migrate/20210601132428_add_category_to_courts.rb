class AddCategoryToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :category, :string
    add_column :courts, :surfaces, :string
  end
end
