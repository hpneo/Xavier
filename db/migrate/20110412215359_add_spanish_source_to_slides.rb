class AddSpanishSourceToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :spanish_source_file_name, :string
    add_column :slides, :spanish_source_content_type, :string
    add_column :slides, :spanish_source_updated_at, :datetime
    add_column :slides, :spanish_source_file_size, :integer
  end

  def self.down
    remove_column :slides, :spanish_source_file_size
    remove_column :slides, :spanish_source_updated_at
    remove_column :slides, :spanish_source_content_type
    remove_column :slides, :spanish_source_file_name
  end
end
