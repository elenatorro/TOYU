class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :project_id
      t.integer :interview_id
      t.string :question
      t.text :answer
      t.timestamps
    end
  end
end
