class ApplicationController < ActionController::Base

  before_action :authenticate_user!


  # Prevent CSRF attacks by raising an exception
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  ####before_filter deprecated, before_action is used instead
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
	
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }

    end



end
