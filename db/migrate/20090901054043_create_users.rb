class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.timestamps
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
    end

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at

    # add user_id columns to essays
      # t.user_id :integer
    add_column :essays, :user_id, :integer
    # sera bueno poner este index aqui
    add_index :essays, :user_id

  end

  def self.down
    drop_table :users
    remove_column :essays, :user_id, :integer
    
  end
end
