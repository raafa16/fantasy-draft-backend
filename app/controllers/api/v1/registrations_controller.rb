class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create!(
      name: registration_params[:name],
      email: registration_params[:email],
      password: registration_params[:password],
      password_confirmation: registration_params[:password_confirmation]
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: {
        status: 500,
        message: 'Sorry, your registration was not successful. Please verify that you have provided all required information and try again.'
      }
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
