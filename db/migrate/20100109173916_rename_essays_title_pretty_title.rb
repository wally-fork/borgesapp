class RenameEssaysTitlePrettyTitle < ActiveRecord::Migration
  def self.up
    # title => url_title
    # pretty_title => title
    rename_column(:essays, :title, :url_title)
    rename_column(:essays, :pretty_title, :title)
    
  end

  def self.down
    rename_column(:essays, :title, :pretty_title)
    rename_column(:essays, :url_title, :title)
  end

end
