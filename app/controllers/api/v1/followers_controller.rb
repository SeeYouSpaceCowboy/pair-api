class Api::V1::FollowersController < ApplicationController
  # before_action :set_stock, only: [:show, :update, :destroy]

  def index

    if 1
      render json: stock_list
    else
      render json: {no_friends: 'user has no friends'}
    end
  end

  def create

  end

  def destroy

  end

  private

end
