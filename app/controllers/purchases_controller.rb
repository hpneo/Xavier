class PurchasesController < ApplicationController
	
	before_filter :authenticate_user!
	
	def cart
		@products = current_user.pending
	end
	
	def create
		@purchase = Purchase.new(params[:purchase])
		@purchase.user_id = current_user.id
		@purchase.status = 'paid'
		
		if @purchase.purchase_valid?
			if @purchase.save
				flash[:success] = "Product purchased successfully"
				redirect_to '/my_products'
			end
		end
	end
	
end