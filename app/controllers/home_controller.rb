class HomeController < ApplicationController
	
	def index
		@recent_courses = Product.courses.recent
		@popular_courses = Product.courses.popular
    if session[:language] && session[:es]
		  @slides = Slide.spanish_slides 
	  else
		  @slides = Slide.english_slides
	  end
	end
	
	def language
		if params[:lang]
    		lang = params[:lang]
    		I18n.locale = params[:lang].to_sym
    	else
    		lang = "en"
    		I18n.locale = :en
    	end
    	
    	session[:language] = lang

    	redirect_to request.env["HTTP_REFERER"]
	end
	
end