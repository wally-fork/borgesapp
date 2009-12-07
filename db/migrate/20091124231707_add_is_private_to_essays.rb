class AddIsPrivateToEssays < ActiveRecord::Migration
  def self.up
    add_column :essays, :is_private, :boolean, :default => 0
  end

  def self.down
    remove_column :essays, :is_private
  end
end
