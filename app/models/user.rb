class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable, :lockable and :timeoutable
	devise :database_authenticatable, :registerable,
				:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
	
	has_many :purchases, :dependent => :destroy
	has_many :products, :through => :purchases
	
	def pending
		products.joins(:purchases).where(:purchases =>{:status => "pending" })
	end
	
	def paid
		products.joins(:purchases).where(:purchases =>{:status => "paid" })
	end
end
