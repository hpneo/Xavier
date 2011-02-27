class Admin::PagesController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@pages = Page.all
	end
	
	def edit
		@page = Page.find(params[:id])
	end
	
	def update
		@page = Page.find(params[:id])
		
		if @page.update_attributes(params[:page])
	  		flash[:success] = "Page updated"
	  		redirect_to admin_pages_path
	  	else
	  		render 'edit'
	  	end
	end
	
end