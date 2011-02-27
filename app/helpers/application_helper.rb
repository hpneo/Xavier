module ApplicationHelper
	
	def nav_class(path)
		if is_current_path(path)
			'current'
		end
	end
	
	def is_current_path(path)
		request.env['PATH_INFO'] == path
	end

end
