class CreateEssays < ActiveRecord::Migration
  def self.up
    create_table :essays do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :essays
  end
end
