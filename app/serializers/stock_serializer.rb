class StockSerializer < ActiveModel::Serializer
  attributes :ticker, :company_name
end
