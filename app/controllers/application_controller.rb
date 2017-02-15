class ApplicationController < ActionController::API
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    token = request.headers['HTTP_AUTHORIZATION']

    if token
      user_infor = Auth.decode(token)
      @user ||= User.find(user_info['user_id'])
    end

    @user
  end
end
