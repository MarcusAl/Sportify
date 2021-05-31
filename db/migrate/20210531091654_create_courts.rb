class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :price

      t.timestamps
    end
  end
end
