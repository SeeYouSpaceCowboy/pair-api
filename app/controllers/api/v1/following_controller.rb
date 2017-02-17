class Api::V1::FollowingController < ApplicationController
  # before_action :set_stock, only: [:show, :update, :destroy]

  def index
    @user = get_current_user
    if @user.followers.length > 0
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
