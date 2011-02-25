class Category < ActiveRecord::Base
	
	def to_param
		if name
			"#{id}-#{name.parameterize}"
		else
			super
		end
	end
end
