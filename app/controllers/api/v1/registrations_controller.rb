class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(
      name: registration_params[:name],
      email: registration_params[:email],
      password: registration_params[:password],
      password_confirmation: registration_params[:password_confirmation]
    )
    if @user.save
      sign_in(@user)
      render json: @user, status: :created
    else
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
