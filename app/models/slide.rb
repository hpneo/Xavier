class Slide < ActiveRecord::Base
	
	has_attached_file :source,
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => '/slide/:id/:filename'
	
	def file
		file = Slide.where(:id => self.id).last
		if file
			file.source
		else
			nil
		end
	end
end
