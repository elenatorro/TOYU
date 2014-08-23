class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :project_id
      t.string :name
      t.integer :age
      t.string :location
      t.string :gender
      t.text :education
      t.text :hobbies
      t.text :description
      t.text :tech_level
      t.text :goals
      t.text :challenges
      t.string :image
      t.timestamps
    end
  end
end
