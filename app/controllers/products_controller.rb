class ProductsController < ApplicationController
	
	before_filter :authenticate_user!, :only => [:add_to_cart, :purchase]
	
	def show
		@product = Product.find(params[:id])
	end
	
	def add_to_cart
		@product = Product.find(params[:product_id])
		@purchase = @product.purchases.build :user_id => current_user.id, :status => 'pending'
		
		if @purchase.save
			redirect_to '/cart'
    else
      flash[:warning] = "There was an issue while processing your cart"
      render :show
		end
	end
	
	def purchase
		@product = Product.find(params[:product_id])
    	@purchase = @product.purchases.build
	end
	
end
