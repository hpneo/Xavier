class SearchController < ApplicationController
	
	def search
		@products = Product.name_like(params[:search]).all
	end
	
end