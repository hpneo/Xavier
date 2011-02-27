class Admin::UsersController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@users = User.all
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		
		if @user.update_attributes(params[:user])
	  		flash[:success] = "User updated"
	  		redirect_to admin_users_path
	  	else
	  		render 'edit'
	  	end
	end
	
end