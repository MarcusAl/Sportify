class AddCoordinatesToCourts < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :latitude, :float
    add_column :courts, :longitude, :float
  end
end
