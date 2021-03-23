class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :pnr
      t.integer :price

      t.timestamps
    end
  end
end
