class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.text :name_r, null: false
      t.index :name_r, unique: true
      t.text :times_of_day, null: false
      t.text :range, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
