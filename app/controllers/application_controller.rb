class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def parse_yaml(file)
    YAML::load(File.open(file))
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name date_of_birth username phone_number])
    devise_parameter_sanitizer.permit(:account_updated, keys: %i[first_name last_name date_of_birth username phone_number])
  end
end
