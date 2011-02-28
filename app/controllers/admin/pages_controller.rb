class Admin::PagesController < ApplicationController
	
	before_filter :authenticate_admin!

	def index
		@pages = Page.all
	end
	
	def new
		@page = Page.new
	end
	
	def create
		@page = Page.new(params[:page])
		
		if @page.save
			flash[:success] = "Page created successfully"
		else
			flash[:error] = "Error"
		end
		
		redirect_to admin_pages_path
	end
	
	def edit
		@page = Page.find(params[:id])
	end
	
	def update
		@page = Page.find(params[:id])
		
		if @page.update_attributes(params[:page])
	  		flash[:success] = "Page updated, #{undo_link}"
	  		redirect_to admin_pages_path
	  	else
	  		render 'edit'
	  	end
	end
	
	def destroy
		@page = Page.find(params[:id])
		if @page.destroy
			flash[:success] = "Page destroyed, #{undo_link}"
		end
  		redirect_to admin_pages_path
	end
	
	private
		def undo_link
			view_context.link_to("undo", revert_version_path(@page.versions.scoped.last), :method => :post)
		end
end