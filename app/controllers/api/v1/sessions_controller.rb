class Api::V1::SessionsController < ApplicationController
  def create
    @user = User
            .find_by(email: session_params[:email])
            .try(:authenticate, session_params[:password])
    if @user
      sign_in(@user)
      render json: {
        status: :created,
        user: @user,
        logged_in: true
      }
    else
      render json: {
        status: 401,
        message: "Invalid username or password."
      }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private
  def session_params
    params.require(:user).permit(:name, :email, :password)
  end
end
