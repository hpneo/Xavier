class Admin::ProductsController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@products = Product.all
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def update
		@product = Product.find(params[:id])
		
		if @product.update_attributes(params[:product])
	  		flash[:success] = "Product updated"
	  		redirect_to admin_products_path
	  	else
	  		render 'edit'
	  	end
	end
	
end