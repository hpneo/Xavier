class ApplicationController < ActionController::Base
  protect_from_forgery
  
	def authenticate_admin!
  		redirect_to root_path unless current_user && authenticate_user! && current_user.admin?
	end
end
