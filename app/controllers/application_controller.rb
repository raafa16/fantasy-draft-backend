class ApplicationController < ActionController::API
  # include ActionController::Cookies
  # include ActionController::RequestForgeryProtection
  include ActionController::Serialization
  include CurrentUserConcern

  # protect_from_forgery with: :null_session

  # protect_from_forgery with: :exception
  # before_action :set_csrf_cookie

  # private

  # def set_csrf_cookie
  #   cookies["CSRF-TOKEN"] = form_authenticity_token
  # end
end
