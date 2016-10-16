class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_admin_timezone
    Time.zone = 'Eastern Time (US & Canada)'
  end

  def user_is_first_time
    if current_user.user_completions == []
      current_user.first_time_user = true
    else
      current_user.first_time_user = false
    end
  end

  def after_sign_up_path_for(resource)
  	request.env['omniauth.origin'] || stored_location_for(resource) || after_signup_path(:setup_profile)
    # new_profile_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
    # dashboard_path
  end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone_number])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :email, :phone_number])
  			
  	end


end
