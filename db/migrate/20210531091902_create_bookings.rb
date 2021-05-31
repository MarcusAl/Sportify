class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :court, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
