class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :aeroplane, null: false, foreign_key: true
      t.string :origin
      t.string :dist
      t.timestamps
    end
  end
end
