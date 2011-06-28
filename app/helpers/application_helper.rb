module ApplicationHelper
	
	def meta
		SiteOption.where({:option_type => 'meta'})
	end
	
	def nav_class(path)
		if is_current_path(path)
			'current'
		end
	end
	
	def is_current_path(path)
		request.env['PATH_INFO'] == path
	end
	
	def page_title(id)
		if Rails.env.production?
			page = Page.find(id)
		else
			page = Page.first
		end
		if cookies[:language]==nil || cookies[:language]=="en"
			page.title
		else
			page.spanish_title
		end
	end

end
