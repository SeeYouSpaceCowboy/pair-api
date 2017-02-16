require 'rest-client'
require 'json'
require 'openssl'
require "base64"

class Api::V1::StockDataController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]


  # Market Cap
  # Day range
  # 52-week range
  # Dividend & Yield

  def index
    @stocks = Stock.all
    if @stocks.length > 1
      stock_list = @stocks.collect {|stock|

      # historical_data endpoint
      url = "https://api.intrinio.com/historical_data?ticker=#{stock.symbol}&item=close_price&start_date=2017-02-15&end_date=2017-02-15"

      response = api_call(url)
      response[:company_name] = stock.company_name
      response
      }

      render json: stock_list
    else
      render json: {data: 'no stocks'}
    end
  end

  def check_for_stock
    url = "https://api.intrinio.com/companies?query=#{params[:id]}"

    response = api_call(url)
    render json: response

  end

  def show
    url = "https://api.intrinio.com/data_point?ticker=#{params[:id]}&item=last_price"

    response = api_call(url)
    render json: response
  end


  #news endpoint
  # https://api.intrinio.com/news?ticker=AAPL&ticker=MSFT



  private

end
