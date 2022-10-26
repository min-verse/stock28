class CreateHistoricalStockData < ActiveRecord::Migration[7.0]
  def change
    create_table :historical_stock_data do |t|
      t.string :date
      t.integer :price
      t.integer :stock_id
      t.timestamps
    end
  end
end
