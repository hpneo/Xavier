class AddMailTemplates < ActiveRecord::Migration
  def self.up
  	SiteOption.create(:name => 'confirmation_mail', :value => "<p>Welcome [[resource_email]] to ABC-Elearning!</p>
<p>You can confirm your account through the link below:</p>
<p>[[confirmation_link]]</p>", :option_type => 'email')
  	SiteOption.create(:name => 'reset_password_mail', :value => "<p>Hello [[resource_email]]!</p>
<p>Someone has requested a link to change your password, and you can do this through the link below.</p>
<p>[[edit_password_url]]</p>
<p>If you didn't request this, please ignore this email.</p>
<p>Your password won't change until you access the link above and create a new one.</p>", :option_type => 'email')
  	SiteOption.create(:name => 'unlock_mail', :value => "<p>Hello [[resource_email]]</p>
<p>Your account has been locked due to an excessive amount of unsuccessful sign in attempts.</p>
<p>Click the link below to unlock your account:</p>
<p>[[unlock_account_url]]</p>", :option_type => 'email')
  end

  def self.down
  end
end
