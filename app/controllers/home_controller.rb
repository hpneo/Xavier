class HomeController < ApplicationController
	
	def index
		@recent_courses = Product.courses.recent
		@popular_courses = Product.courses.popular
	end
	
	def language
	 
	end
	
end