class Admin::SlidesController < ApplicationController
	uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])	
	before_filter :authenticate_admin!

	def index
		@slides = Slide.all
	end
	
	def new
		@slide = Slide.new
	end
	
	def create
		@slide = Slide.new(params[:slide])
		
		if @slide.save
			flash[:success] = "Slide created successfully"
		else
			flash[:error] = "Error"
		end
		
		redirect_to admin_slides_path
	end
	
	def edit
		@slide = Slide.find(params[:id])
	end
	
	def update
		@slide = Slide.find(params[:id])
		
		if @slide.update_attributes(params[:slide])
	  		flash[:success] = "Slide updated"
	  		redirect_to admin_slides_path
	  	else
	  		render 'edit'
	  	end
	end
	
	def destroy
		@slide = Slide.find(params[:id])
		if @slide.destroy
			flash[:success] = "Slide destroyed"
		end
  		redirect_to admin_slides_path
	end
end