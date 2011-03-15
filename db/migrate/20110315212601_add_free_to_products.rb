class AddFreeToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :free, :boolean
  end

  def self.down
    remove_column :products, :free
  end
end
