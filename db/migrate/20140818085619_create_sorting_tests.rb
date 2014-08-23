class CreateSortingTests < ActiveRecord::Migration
  def change
    create_table :sorting_tests do |t|
      t.integer :project_id
      t.string :url
      t.string :password
      t.timestamps
    end
  end
end
