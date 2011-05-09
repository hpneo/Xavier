class CreateSiteOptions < ActiveRecord::Migration
  def self.up
    create_table :site_options do |t|
      t.string :name
      t.text :value
      t.string :option_type

      t.timestamps
    end
  end

  def self.down
    drop_table :site_options
  end
end
