class ApplicationController < ActionController::Base

	before_action 
	def set_locale
	  
	 if session[:locale].present?
	 	logger.info "Setting locale to #{session[:locale]}"
	 	I18n.locale = session[:locale]
	 else
	 	I18n.locale = :en
	 end
	end
	before_action :set_locale

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			nil
		end
	end
	helper_method :current_user
end
