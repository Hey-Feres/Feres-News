class ApplicationController < ActionController::Base
	#before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_locale
	
	def swicth_language
		puts "(((((((((((((("
		puts params
	end

  	protected
  		def configure_permitted_parameters
    		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  		end
		
		def set_locale
			session[:locale] = params[:locale] if params[:locale].present?
			I18n.locale = session[:locale] || I18n.default_locale
			@language = session[:locale] == :en ? 'en' : 'pt'
			@country = session[:locale] == :en ? 'us' : 'br'
		end
end
