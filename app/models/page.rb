class Page < ActiveRecord::Base
	
	validates :title, :presence => true
	validates :content, :presence => true
	
	def to_param
		if title
			"#{id}-#{title.parameterize}"
		else
			super
		end
	end
	
end
