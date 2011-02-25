class Category < ActiveRecord::Base
	
	def to_param
		if name
			"#{id}-#{name}"
		else
			super
		end
	end
end
