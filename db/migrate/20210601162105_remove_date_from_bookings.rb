class RemoveDateFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date
    add_column :bookings, :start_time, :datetime
    add_column :bookings, :end_time, :datetime
  end
end
