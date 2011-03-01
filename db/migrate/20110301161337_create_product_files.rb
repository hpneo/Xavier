class CreateProductFiles < ActiveRecord::Migration
	def self.up
		create_table :product_files do |t|
			
			t.string :source_file_name
			t.string :source_content_type
			t.integer :source_file_size
			t.integer :product_id

			t.timestamps
		end
		
		add_index :product_files, :product_id
	end

	def self.down
		drop_table :product_files
	end
end
