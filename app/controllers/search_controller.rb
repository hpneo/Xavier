class SearchController < ApplicationController
	
	def search
		if params[:search].nil?
			@search_params = {:name_contains => params[:name_contains], :category_name_contains => params[:category_name_contains], :summary_contains => params[:summary_contains]}
		else
			@search_params = params[:search]
		end
		
		@search_term = (@search_params[:name_or_category_name_or_summary_contains].nil?) ? @search_params[:name_contains] : @search_params[:name_or_category_name_or_summary_contains]
		
		@search = Product.search(@search_params)
		@products = @search.all
	end
	
	def advanced_search
		@search = Product.search(params[:advanced_search])
		@products = @search.all
	end
	
end