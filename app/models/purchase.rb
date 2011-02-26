class Purchase < ActiveRecord::Base
	
	attr_accessor :credit_card_number, :expiration_date, :csc_code
	
	belongs_to :product
	belongs_to :user
	
	def purchase_valid?
		true
	end
	
end
