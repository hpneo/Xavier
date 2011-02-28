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
	  		flash[:success] = "Category updated, #{undo_link}"
	  		redirect_to admin_categories_path
	  	else
	  		render 'edit'
	  	end
	end
	
	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			flash[:success] = "Category destroyed, #{undo_link}"
		end
  		redirect_to admin_categories_path
	end
	
	private
		def undo_link
			view_context.link_to("undo", revert_version_path(@category.versions.scoped.last), :method => :post)
		end
end