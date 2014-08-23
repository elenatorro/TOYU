class AddPasswordEncryptationToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :password_hash, :string
  	add_column :projects, :password_salt, :string
  	remove_column :projects, :password, :string
  end
end
