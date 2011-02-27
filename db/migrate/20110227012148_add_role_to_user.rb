class AddRoleToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :role, :string, :default => 'user'
  end

  def self.down
  end
end
