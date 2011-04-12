class Slide < ActiveRecord::Base
	
	has_attached_file :source,
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => '/slide/:id/:filename'

	has_attached_file :spanish_source,
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => '/slide/spanish/:id/:filename'
	
	def file
		self.source
	end

end
