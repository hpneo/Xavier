class CreateProducts < ActiveRecord::Migration
	
	def self.up
		create_table :products do |t|
			t.string :name
			t.text :summary
			t.float :price
			t.string :role
			t.integer :category_id
			
			t.timestamps
		end
    
		add_index :products, :category_id
	end

	def self.down
    	drop_table :products
	end

end