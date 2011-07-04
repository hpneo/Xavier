class Notifier < ActionMailer::Base
	
	def support_notification(sender)
		@sender = sender
		mail(:to => 'admin@abc-onlinelearningcenter.com', :from => sender.email, :subject => 'New #{sender.support_type}')
	end
	
end
