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

    # => API INTRINO
      date = "2017-02-16"
      url = "https://api.intrinio.com/prices?ticker=#{stock.ticker}&start_date=#{date}&end_date=#{date}"

      response = api_call(url)
      response[:company_name] = stock.company_name
      response[:identifier] = stock.ticker

      url = "https://api.intrinio.com/historical_data?ticker=#{stock.ticker}&item=marketcap&start_date=#{date}&end_date=#{date}"
      market_cap = api_call(url)

      response["data"][0][:market_cap] = market_cap["data"][0]["value"]

      response
    #   END OF API

    # => FAKE DATA TO AVOID API CALL
      #   stock_data = {
      #     identifier: "#{stock.ticker}",
      #     company_name: "#{stock.company_name}",
      #     data: [{
      #       open: 1,
      #       close: 1,
      #       high: 1,
      #       low: 1,
      #       market_cap: 1
      #     }]
      #   }
      #   stock_data
      # }
      #  END OF FAKE DATA

      render json: stock_list
    else
      render json: {na: 'no stocks'}
    end
  end

  def user_stocks
    @stocks = get_current_user.stocks
    if @stocks.length > 0
      stock_list = @stocks.collect {|stock|
        stock.ticker
      }
    end
    render json: stock_list
  end

  def check_for_stock
    url = "https://api.intrinio.com/companies?query=#{params[:id]}"

    response = api_call(url)
    response = response['data'][0..4]
    render json: response

  end

  def show
    url = "https://api.intrinio.com/historical_data?ticker=#{stock.ticker}&item=close_price&start_date=2017-02-16&end_date=2017-02-16"

    response = api_call(url)
    response[:company_name] = stock.company_name


    render json: response
  end


  #news endpoint
  # https://api.intrinio.com/news?ticker=AAPL&ticker=MSFT



  private

end
