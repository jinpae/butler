class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	protected
		# Permit additional parameters if devise generated controllers are used.
		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) << :first_name
			devise_parameter_sanitizer.for(:sign_up) << :last_name
			devise_parameter_sanitizer.for(:sign_up) << :username
			devise_parameter_sanitizer.for(:account_update) << :first_name
			devise_parameter_sanitizer.for(:account_update) << :last_name
			devise_parameter_sanitizer.for(:account_update) << :username
		end

		def require_admin
			unless current_user.admin?
				redirect_to root_url, alert: "Access denied!"
			end
		end
end
