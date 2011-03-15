class Page < ActiveRecord::Base
	
	validates :title, :presence => true
	validates :content, :presence => true
	
	has_paper_trail
	LOCALES = {:es => "Español", :en => "English"}
		
	def to_param
		if title
			"#{id}-#{title.parameterize}"
		else
			super
		end
	end
	
end
