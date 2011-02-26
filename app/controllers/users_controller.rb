class UsersController < ApplicationController
	
	def my_products
		@products = current_user.paid
	end
	
	def show
		@user = User.find(params[:id])
	end
	
end