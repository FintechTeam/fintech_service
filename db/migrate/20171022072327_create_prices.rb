class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :ask
      t.decimal :bid
      t.integer :exchange_id
      t.datetime :acquisition_time

      t.timestamps
    end
  end
end
