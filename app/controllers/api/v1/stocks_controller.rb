class Api::V1::StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

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
    @stock = Stock.new(stock_params)

    if @stock.save
      get_current_user.stocks << @stock
      url = "https://api.intrinio.com/historical_data?ticker=#{@stock.symbol}&item=close_price&start_date=2017-02-15&end_date=2017-02-15"
      response = api_call(url)
      response[:company_name] = @stock.company_name
      print response
      render json: response
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:symbol, :company_name)
    end
end
