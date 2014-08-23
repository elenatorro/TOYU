class CreateSiteRequirements < ActiveRecord::Migration
  def change
    create_table :site_requirements do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
