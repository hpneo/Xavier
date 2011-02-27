class Admin::PagesController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@pages = Page.all
	end
	
end