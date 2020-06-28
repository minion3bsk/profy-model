class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_prameters, if: :devise_controller?
  
  def configure_permitted_prameters
    devise_parameter_sanitizer.permit(:sign_in, keys:[:group_key])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:group_key])
    devise_parameter_sanitizer.permit(:account_update, keys:[:group_key])
  end  
end
