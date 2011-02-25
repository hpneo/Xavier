class Page < ActiveRecord::Base
	
	def to_param
		if title
			"#{id}-#{title.parameterize}"
		else
			super
		end
	end
	
end
