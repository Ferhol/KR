class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :date_o, null: false
      t.time :time_o, null: false
      t.text :address_o, null: false
      t.text :address_p, null: false
      t.integer :number_p, null: false
      t.float :route_length, null: false
      t.references :driver1, foreign_key: true
      t.references :rate, foreign_key: true

      t.timestamps
    end
  end
end
