class Category < ActiveRecord::Base
	
	validates :name, :presence => true
	
	def to_param
		if name
			"#{id}-#{name.parameterize}"
		else
			super
		end
	end
end
