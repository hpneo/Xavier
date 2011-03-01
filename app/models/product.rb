class Product < ActiveRecord::Base
	
	scope :courses, where(:role => 'course')
	scope :recent, order('created_at DESC').limit(4)
	scope :popular, where(:role => 'course').where('category_id >= 2')

	has_many :purchases
	belongs_to :category
	
	validates :name, :presence => true
	#validates :summary, :presence => true
	validates :price, :presence => true, :numericality => true
	validates :role, :presence => true
	validates :category_id, :presence => true
	
	has_paper_trail
	
	has_many :product_files
	
	attr_accessor :product_file
	
	def file
		ProductFile.where(:product_id => self.id).last.source
	end
	
	def to_param
		if name
			"#{id}-#{name.parameterize}"
		else
			super
		end
	end
end
