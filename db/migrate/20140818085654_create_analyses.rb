class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.integer :project_id
      t.text :context
      t.integer :duration
      t.string :evaluator
      t.string :writer
      t.text :test
      t.timestamps
    end
  end
end
