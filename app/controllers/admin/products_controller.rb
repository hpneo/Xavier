class Admin::ProductsController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
	end
	
	def create
		@product = Product.new(params[:product])
		
		if @product.save
			@product_file = ProductFile.new(params[:product][:product_file])
			@product_file.product_id = @product.id
			
			if @product_file.save
				flash[:success] = "Product added successfully"
			else
				flash[:error] = "Error at uploading file"
			end
		else
			flash[:error] = "Error"
		end
		
		redirect_to admin_products_path
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def update
		@product = Product.find(params[:id])
		
		if @product.update_attributes(params[:product])
			@product_file = ProductFile.new(params[:product][:product_file])
			@product_file.product_id = @product.id
			
			if @product_file.save
	  			flash[:success] = "Product updated, #{undo_link}"
  			else
  				flash[:error] = "Error at uploading file, #{undo_link}"
  			end
	  		redirect_to admin_products_path
	  	else
	  		render 'edit'
	  	end
	end
	
	def destroy
		@product = Product.find(params[:id])
		if @product.destroy
			flash[:success] = "Product destroyed, #{undo_link}"
		end
  		redirect_to admin_products_path
	end
	
	private
		def undo_link
			view_context.link_to("undo", revert_version_path(@product.versions.scoped.last), :method => :post)
		end
end