class SiteOption < ActiveRecord::Base
	
	has_paper_trail
	
	def self.mail_template(name)
		@option = SiteOption.where(:name => name).first
		if @option
			@option.value.html_safe
		end
	end
	
end