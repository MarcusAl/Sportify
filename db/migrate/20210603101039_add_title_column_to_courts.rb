class AddTitleColumnToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :title, :string
  end
end
