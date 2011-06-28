class Admin::SiteOptionsController < ApplicationController
	uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
	
	def index
		@options = SiteOption.all
	end
	
	def new
		@option = SiteOption.new
		@value_class = params[:mailer] ? 'mceEditor' : ''
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
		@value_class = (params[:mailer] || @option.option_type=='email') ? 'mceEditor' : ''
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
		@site_option = SiteOption.find(params[:id])
		if @site_option.destroy
			flash[:success] = "Site option destroyed, #{undo_link}"
		end
		redirect_to admin_site_options_path
	end
	
	private
		def undo_link
			view_context.link_to("undo", revert_version_path(@site_option.versions.scoped.last), :method => :post)
		end
end