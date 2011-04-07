class AddSpanishTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :spanish_title, :string
  end

  def self.down
    remove_column :pages, :spanish_title
  end
end
