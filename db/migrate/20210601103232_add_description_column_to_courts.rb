class AddDescriptionColumnToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :description, :text
  end
end
