class Api::V1::StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update]

  # GET /stocks
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  # GET /stocks/1
  def show
    render json: @stock
  end

  # POST /stocks
  def create
    @stock = Stock.create(stock_params)

    if @stock.save
      date = "2017-02-16"
      get_current_user.stocks << @stock

      url = "https://api.intrinio.com/prices?ticker=#{@stock.ticker}&start_date=#{date}&end_date=#{date}"
      response = api_call(url)

      response[:company_name] = @stock.company_name
      response[:ticker] = @stock.ticker
      response[:last_price] = @stock.last_price
      render json: response
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock = Stock.find_by(ticker: params[:ticker])
    get_current_user.stock_users.find_by(stock_id: @stock.id).destroy
    render json: @stock.ticker
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:ticker, :company_name)
    end
end
