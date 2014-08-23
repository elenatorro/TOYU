class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :project_id
      t.integer :sorting_test_id
      t.string :name
      t.string :color
      t.timestamps
    end
  end
end
