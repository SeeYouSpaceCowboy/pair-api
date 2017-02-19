class StockListSerializer < ActiveModel::Serializer
  attributes :ticker, :company_name
end
