class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      case resource
      when User
        users_users_path
      when Doctor
        doctors_doctors_path
      end
    end

    protected
  
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :phone, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:phone, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
