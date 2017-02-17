class ChangeStockSymbolToTicker < ActiveRecord::Migration[5.0]
  def change
    rename_column :stocks, :symbol, :ticker
  end
end
