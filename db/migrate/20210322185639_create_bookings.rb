class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :fullname
      t.references :flight, null: false, foreign_key: true
      t.references :aeroplane, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
      t.integer :paid

      t.timestamps
    end
  end
end
