class Purchase < ActiveRecord::Base
	
	attr_accessor :credit_card_number, :expiration_date, :csc_code

  STATUS = { :pending => "pending", :paid => "paid" }

  scope :pending, where(:status => STATUS[:pending])
  scope :paid, where(:status => STATUS[:paid])
    
	belongs_to :product
	belongs_to :user
	
	def purchase_valid?
		true
	end
	
end
