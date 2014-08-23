class CreateUseCases < ActiveRecord::Migration
  def change
    create_table :use_cases do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.text :field_of_application
      t.text :actors
      t.text :precondition
      t.text :trigger
      t.text :basic_flow
      t.text :alternate_flow
      t.text :postcondition
      t.timestamps
    end
  end
end
