class AddLastPriceToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :last_price, :float, :default => 0.00
  end
end
