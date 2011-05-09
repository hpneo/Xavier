class Admin::SiteOptionsController < ApplicationController
	
	def index
		@options = SiteOption.all
	end
	
	def new
		@option = SiteOption.new
	end
	
	def create
		@option = SiteOption.new(params[:site_option])
		
		if @option.save
			flash[:success] = "Site option created successfully"
		else
			flash[:error] = "Error"
		end
		
		redirect_to admin_site_options_path
	end
	
	def edit
		@option = SiteOption.find(params[:id])
	end
	
	def update
		@option = SiteOption.find(params[:id])
		
		if @option.update_attributes(params[:site_option])
	  		flash[:success] = "Site option updated"
	  		redirect_to admin_site_options_path
	  	else
	  		render 'edit'
	  	end
	end
	
	def destroy
		@option = SiteOption.find(params[:id])
		if @option.destroy
			flash[:success] = "Site Option destroyed, #{undo_link}"
		end
  		redirect_to admin_site_options_path
	end
	
end