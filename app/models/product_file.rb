class ProductFile < ActiveRecord::Base
	
	belongs_to :product
	
	has_attached_file :source,
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => '/:attachment/:id/:filename'
	
  # validates_attachment_presence :source
  # validates_attachment_content_type :source, :content_type => ['application/zip', 'application/x-gzip', 'application/pdf']
	
end
