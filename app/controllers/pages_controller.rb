class PagesController < ApplicationController
	
	def show
		@page = Page.find(params[:id])
		case @page.id
			when 18: #ourcourses
				@courses = Product.courses
			when 24: #free courses
				@courses = Product.courses.free
			when 15: #bestsellers
				@courses = Product.courses.popular
			when 17: #categories
				@categories = Category.all
		end
	end
	
end