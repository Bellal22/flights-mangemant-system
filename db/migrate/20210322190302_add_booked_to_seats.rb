class AddBookedToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :booked, :integer
  end
end
