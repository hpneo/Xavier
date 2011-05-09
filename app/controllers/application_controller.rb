class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_cookie
  
	def authenticate_admin!
  		redirect_to root_path unless current_user && authenticate_user! && (current_user.admin? || current_user.editor?)
	end
	
	def check_cookie
	 cookies[:language] ||= "en"
	 I18n.locale = cookies[:language].to_sym
	end

end
