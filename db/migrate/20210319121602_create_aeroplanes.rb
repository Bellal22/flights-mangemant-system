class CreateAeroplanes < ActiveRecord::Migration[6.1]
  def change
    create_table :aeroplanes do |t|
      t.string :model
      t.integer :seats_no

      t.timestamps
    end
  end
end
