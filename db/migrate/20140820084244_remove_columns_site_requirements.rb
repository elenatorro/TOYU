class RemoveColumnsSiteRequirements < ActiveRecord::Migration
  def change
  	remove_column :site_requirements, :name, :string
  	remove_column :site_requirements, :description, :text
  end
end
