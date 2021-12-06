class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:license_plate_number, :vehicle_id, :location])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:license_plate_number, :vehicle_id, :location])
  end
end
