class CreateSlides < ActiveRecord::Migration
  def self.up
	create_table :slides do |t|
	
		t.string :source_file_name
		t.string :source_content_type
		t.integer :source_file_size
	
		t.timestamps
	end
  end

  def self.down
  	drop_table :slides
  end
end
