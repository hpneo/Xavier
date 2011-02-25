class Product < ActiveRecord::Base
	
	scope :courses, where(:role => 'course')
	scope :recent, order('created_at DESC').limit(4)
	scope :popular, where(:role => 'course').where('category_id >= 2')
	
	def category
		Category.find(category_id)
	end
end
