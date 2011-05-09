class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable, :lockable and :timeoutable
	devise :database_authenticatable, :registerable, :confirmable,
				:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role
	
	has_many :purchases, :dependent => :destroy
	has_many :products, :through => :purchases
	
	def pending_purchases
    	purchases.pending
	end
	
	def pending_purchases_amount
		if purchases.pending.count>0
			amount = 0
			purchases.pending.map {|purchase| purchase.product.price}.each{|i| amount+=i }
			amount
		else
			amount = 0
		end
	end
	
	def paid_purchases
		purchases.paid
	end
	
	def paid_purchases_amount
		if purchases.paid.count>0
			amount = 0
			purchases.paid.map {|purchase| purchase.product.price}.each{|i| amount+=i }
			amount
		else
			amount = 0
		end
	end
	
	def admin?
		role == 'admin'
	end
	
	def editor?
		role == 'editor'
	end
	
	def purchased?(product)
		Purchase.where({:product_id => product.id, :status => "paid", :user_id => id}).present?
	end
end
