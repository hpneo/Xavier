class AddDarkToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :dark, :boolean
  end

  def self.down
    remove_column :slides, :dark
  end
end
