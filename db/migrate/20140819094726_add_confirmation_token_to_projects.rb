class AddConfirmationTokenToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :confirmation_token, :string
    add_column :projects, :confirmed, :boolean, default: false
    add_column :projects, :session_token, :string
  end
end
