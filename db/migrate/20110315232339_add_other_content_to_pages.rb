class AddOtherContentToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :other_content, :text
  end

  def self.down
    remove_column :pages, :other_content
  end
end
