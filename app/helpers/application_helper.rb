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
		page = Page.first
		#page = Page.find(id)
		if cookies[:language]==nil || cookies[:language]=="en"
			page.title
		else
			page.spanish_title
		end
	end

end
