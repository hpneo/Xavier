class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_cookie
  
	def authenticate_admin!
  		redirect_to root_path unless current_user && authenticate_user! && current_user.admin?
	end
	
	def check_cookie
	 cookies[:language] ||= "en"
	end
end
