class ApplicationController < ActionController::API
  # Use callbacks to share common setup or constraints between actions.
  def get_current_user

    token = request.headers['HTTP_AUTHORIZATION']

    if token
      user_info = Auth.decode(token)
      @user ||= User.find(user_info['user_id'])
    end

    @user
  end



  def api_call(url)
    all_stocks = RestClient.get(url, {:'Authorization' => password })
    response = JSON.parse(all_stocks)
  end
end
