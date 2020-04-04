module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user

    def set_current_user
      return @current_user if defined?(@current_user)
      @current_user = User.find_by(id: session[:id]) if session[:user_id]
    end

    def sign_in(user)
      user_id = user.respond_to?(:id) ? user.id : user
      session[:id] = user_id
    end
  end
end