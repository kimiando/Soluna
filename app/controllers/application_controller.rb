class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :user_name, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :user_name, :bio])
  end
end
