class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.integer :project_id
      t.integer :persona_id
      t.text :description
      t.timestamps
    end
  end
end
