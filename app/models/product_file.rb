class ProductFile < ActiveRecord::Base
	
	belongs_to :product
	
	has_attached_file :source,
		:url => '/:attachment/:id/:basename.:extension',
		:path => ':rails_root/public/:attachment/:id/:basename.:extension'
	
	validates_attachment_presence :source
	validates_attachment_content_type :source, :content_type => ['application/zip', 'application/x-gzip', 'application/pdf']
	
end
