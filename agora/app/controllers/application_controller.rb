class ApplicationController < ActionController::Base
  include UsersHelper
  include ProposalsHelper
  include VotesHelper
  
  before_action :configure_device_parameters, if: :devise_controller?
  
  def configure_device_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city_id])
  end

  def after_sign_in_path_for(resource)
    city_path(current_user.city_id)
  end
end