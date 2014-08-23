class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :question
      t.text :answer
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
