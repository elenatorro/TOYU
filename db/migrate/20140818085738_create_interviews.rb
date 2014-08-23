class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :project_id
      t.string :user_name
      t.string :interviwer
      t.timestamps
    end
  end
end
