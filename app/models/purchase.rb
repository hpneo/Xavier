class Purchase < ActiveRecord::Base
	
	attr_accessor :credit_number, :secret
	
	belongs_to :product
	belongs_to :user
	
	def purchase_valid?
		true
	end
	
end
