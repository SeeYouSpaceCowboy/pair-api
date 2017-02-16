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

    @stocks = get_current_user.stocks
    if @stocks.length > 0
      stock_list = @stocks.collect {|stock|
    #
    #   date = "2017-02-15"
    #   url = "https://api.intrinio.com/prices?ticker=#{stock.symbol}&start_date=#{date}&end_date=#{date}"
    #
    #   response = api_call(url)
    #   response[:company_name] = stock.company_name
    #   response[:identifier] = stock.symbol
    #
    #   url = "https://api.intrinio.com/historical_data?ticker=#{stock.symbol}&item=marketcap&start_date=#{date}&end_date=#{date}"
    #   market_cap = api_call(url)
    #
    #   response["data"][0][:market_cap] = market_cap["data"][0]["value"]
    #
    #   response
        stock_data = {
          identifier: "#{stock.symbol}",
          company_name: "#{stock.company_name}",
          data: [{
            open: 1,
            close: 1,
            high: 1,
            low: 1,
            market_cap: 1
          }]
        }
        stock_data
      }
      render json: stock_list
    else
      render json: {na: 'no stocks'}
    end
  end

  def check_for_stock
    url = "https://api.intrinio.com/companies?query=#{params[:id]}"

    response = api_call(url)
    response = response['data'][0..4]
    render json: response

  end

  def show
    url = "https://api.intrinio.com/historical_data?ticker=#{stock.symbol}&item=close_price&start_date=2017-02-15&end_date=2017-02-15"

    response = api_call(url)
    response[:company_name] = stock.company_name


    render json: response
  end


  #news endpoint
  # https://api.intrinio.com/news?ticker=AAPL&ticker=MSFT



  private

end
