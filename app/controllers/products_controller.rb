class ProductsController < ApplicationController
	
	before_filter :authenticate_user!, :only => {:add_to_cart, :purchase}
	
	def show
		@product = Product.find(params[:id])
	end
	
	def add_to_cart
		@product = Product.find(params[:product_id])
		
		@purchase = Purchase.new
		@purchase.product_id = @product.id
		@purchase.user_id = current_user.id
		@purchase.status = 'pending'
		
		if @purchase.save
			redirect_to '/cart'
		end
	end
	
	def purchase
		@product = Product.find(params[:product_id])
		@purchase = Purchase.new(:product_id => @product.id)
	end
	
end