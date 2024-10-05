class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  
    protected
    def current_user?
      @user = User.where(user_id: current_user)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  end