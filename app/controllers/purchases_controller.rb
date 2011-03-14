class PurchasesController < ApplicationController
	
	before_filter :authenticate_user!
	
	def cart
		@purchases = current_user.pending_purchases
	end
	
	def create
		@purchase = Purchase.new(params[:purchase])
		@purchase.user_id = current_user.id
		@purchase.status = 'paid'
		
		if @purchase.purchase_valid?
			if @purchase.save
				UserMailer.new_purchase(current_user, @purchase).deliver
				flash[:success] = "Product purchased successfully"
				redirect_to '/my_products'
			end
		else
			flash[:error] = @purchase.message
			redirect_to '/my_products'
		end
	end
	
end
