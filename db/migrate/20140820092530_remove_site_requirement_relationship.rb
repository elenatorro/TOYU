class RemoveSiteRequirementRelationship < ActiveRecord::Migration
  def change
  	remove_column :requirements, :site_requirement_id, :integer
  	add_column :site_requirements, :requirement1, :text
  	add_column :site_requirements, :requirement2, :text
  	add_column :site_requirements, :requirement3, :text
  	add_column :site_requirements, :requirement4, :text
  	add_column :site_requirements, :requirement5, :text
  	add_column :site_requirements, :requirement6, :text
  	add_column :site_requirements, :requirement7, :text
  	add_column :site_requirements, :requirement8, :text
  	add_column :site_requirements, :requirement9, :text
  	add_column :site_requirements, :requirement10, :text
  end
end
