class Api::V1::FollowingController < ApplicationController
  # before_action :set_stock, only: [:show, :update, :destroy]

  def fetch_following
    @user = User.find_by(username: params[:username])
    if @user.user_following.length > 0
      render json: @user.user_following
    else
      render json: {no_friends: 'user has no friends'}
    end
  end

  def create
    @user = get_current_user
    @target_user = User.find_by(username: params[:username])
    @user.user_following << @target_user
    render json: @user.user_following
  end

  def destroy
    @user = get_current_user
    @target_user = User.find_by(username: params[:username])
    binding.pry
    # @user.user_following.find { |user| user.id === @target_user.id }
    render json: @user.user_following
  end

  private

end
