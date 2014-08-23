class AddAvatarColumnsToPersonas < ActiveRecord::Migration
  def self.up
    add_attachment :personas, :image
  end

  def self.down
    remove_attachment :personas, :image
  end
end
