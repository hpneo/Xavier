class Notifier < ActionMailer::Base
	
	def support_notification(sender)
		@sender = sender
		mail(:to => 'contact@abc-onlinelearningcenter.com', :from => sender.email, :subject => 'New #{sender.support_type}')
	end
	
end
