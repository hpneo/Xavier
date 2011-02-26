class Purchase < ActiveRecord::Base
	
	attr_accessor :credit_card_number, :expiration_date, :csc_code, :message

	STATUS = { :pending => "pending", :paid => "paid" }

	scope :pending, where(:status => STATUS[:pending])
	scope :paid, where(:status => STATUS[:paid])
    
	belongs_to :product
	belongs_to :user
	
	def purchase_valid?
		ActiveMerchant::Billing::Base.mode = :test
		
		amount = (self.product.price*100).to_i
		
		credit_card = ActiveMerchant::Billing::CreditCard.new(
						:first_name         => 'Bob',
						:last_name          => 'Bobsen',
						:number             => '4242424242424242',
						:month              => '8',
						:year               => '2012',
						:verification_value => '1234'
                	)
		
        if credit_card.valid?
        	gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
        				:login => 'TestMerchant',
        				:password => 'password'
        			)
        	
        	response = gateway.purchase(amount, credit_card)
        	
        	self.message = response.message
        	
        	response.success?
        else
        	self.message = "Credit cart not valid"
        end
	end
	
end