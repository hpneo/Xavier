class AddSamplePages < ActiveRecord::Migration
  def self.up
  	Page.create :title => 'Benefits',
  				:content => '<p>We are cool (H)</p>'
  	
  	Page.create :title => 'Testimonials',
  				:content => '<p><img src="http://i.imgur.com/2dAcL.jpg" /></p>'
  end

  def self.down
  end
end
