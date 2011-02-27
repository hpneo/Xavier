class Admin::CategoriesController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@categories = Category.all
	end
	
	def edit
		@category = Category.find(params[:id])
	end
	
	def update
		@category = Category.find(params[:id])
		
		if @category.update_attributes(params[:category])
	  		flash[:success] = "Category updated"
	  		redirect_to admin_categories_path
	  	else
	  		render 'edit'
	  	end
	end
	
end