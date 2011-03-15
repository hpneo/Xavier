class AddLocaleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :locale, :string
  end

  def self.down
    remove_column :pages, :locale
  end
end
