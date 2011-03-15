class HomeController < ApplicationController
	
	def index
		@recent_courses = Product.courses.recent
		@popular_courses = Product.courses.popular
	end
	
	def language
		if params[:lang]
    		lang = params[:lang]
    	else
    		lang = "es"
    	end
    	
    	session[:language] = lang

    	redirect_to request.env["HTTP_REFERER"]
	end
	
end