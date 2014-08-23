class CreateCardImages < ActiveRecord::Migration
  def change
    create_table :card_images do |t|
      t.integer :project_id
      t.integer :sorting_test_id
      t.timestamps
    end
  end
end
