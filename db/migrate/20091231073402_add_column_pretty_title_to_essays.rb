class AddColumnPrettyTitleToEssays < ActiveRecord::Migration
  def self.up
    add_column :essays, :pretty_title, :string
  end

  def self.down
    add_column :essays, :pretty_title
  end
end
