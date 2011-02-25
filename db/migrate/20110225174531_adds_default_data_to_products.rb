class AddsDefaultDataToProducts < ActiveRecord::Migration

	def self.up
		Category.create :name => 'Administrative planning in small business'
		Category.create :name => 'Program accounting for non accountants'
		Category.create :name => 'Sales and marketing program in small business'
		Category.create :name => 'Emotional intelligence'

		Product.create :name => 'Business planning and situational analysis',
						:price => 45.00,
						:role => 'course',
						:category_id => 1

		Product.create :name => 'Business planning and situational analysis',
						:price => 45.00,
						:role => 'course',
						:category_id => 1

		Product.create :name => 'Business planning and situational analysis',
						:price => 45.00,
						:role => 'course',
						:category_id => 1

		Product.create :name => 'Business planning and situational analysis',
						:price => 45.00,
						:role => 'course',
						:category_id => 1

		Product.create :name => 'Basis of accounting',
						:price => 45.00,
						:role => 'course',
						:category_id => 2

		Product.create :name => 'Analysis and interpretation of financial statements basic',
						:price => 45.00,
						:role => 'course',
						:category_id => 2

		Product.create :name => 'Fundamentals of marketing',
						:price => 45.00,
						:role => 'course',
						:category_id => 3

		Product.create :name => 'Emotional intelligence',
						:price => 45.00,
						:role => 'course',
						:category_id => 4
	end

	def self.down
	end

end