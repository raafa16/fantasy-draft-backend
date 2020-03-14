class Api::V1::AuthController < ApplicationController
  skip_before_action :require_login, only: [:login, :auto_login]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, success: "Welcome back, #{user.name}" }
    else
      render json: { error: "Log in failed! Username or password invalid!" }
    end
  end

  def auto_login
    if current_user
      render json: current_user
    else
      render json: {errors: "No User Logged In"}
    end
  end

  def logged_in
    render json: { message: "You have successfully logged in" }
  end
end
