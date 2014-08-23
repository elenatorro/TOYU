class AddSiteRequirementIdToRequirements < ActiveRecord::Migration
  def change
  	add_column :requirements, :site_requirement_id, :integer
  end
end
