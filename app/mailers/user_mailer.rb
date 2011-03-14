class UserMailer < ActionMailer::Base
	default :from => "purchases@abc-onlinelearningcenter.com/"
	
	def new_purchase(user, purchase)
		@user = user
		@purchase = purchase
		mail(:to => user.email, :subject => "New product purchased")
	end
end
