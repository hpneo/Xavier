class ProductsController < ApplicationController
	
	before_filter :authenticate_user!, :only => :purchase
	
	def show
		@product = Product.find(params[:id])
	end
	
	def purchase
		@product = Product.find(params[:product_id])
		@purchase = Purchase.new(:product_id => @product.id)
	end
	
end