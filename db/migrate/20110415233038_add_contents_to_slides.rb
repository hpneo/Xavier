class AddContentsToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :content, :text
    add_column :slides, :spanish_content, :text
  end

  def self.down
    remove_column :slides, :spanish_content
    remove_column :slides, :content
  end
end
