require 'rest-client'
require 'json'
require 'openssl'
require "base64"

class Api::V1::StockDataController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  def index
    url = 'https://api.intrinio.com/data_point?ticker=A&item=last_price'

    @stocks = Stock.all
    all_stocks = RestClient.get(url, {:'Authorization' => password })
    response = JSON.parse(all_stocks)
    print response
    render json: response
  end

  def check_for_stock

    url = "https://api.intrinio.com/companies?query=#{params[:id]}"
    all_stocks = RestClient.get(url, {:'Authorization' => password })
    response = JSON.parse(all_stocks)
    render json: response

  end

  def show

  end

  private

end
