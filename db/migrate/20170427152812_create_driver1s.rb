class CreateDriver1s < ActiveRecord::Migration[5.0]
  def change
    create_table :driver1s do |t|
      t.text :fn, null: false
      t.text :sn, null: false
      t.text :ln
      t.date :birthday, null: false
      t.integer :inn, null: false
      t.index :inn, unique: true
      t.integer :series_p, null: false
      t.integer :number_p, null: false
      t.index :number_p, unique: true

      t.timestamps
    end
  end
end
