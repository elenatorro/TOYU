class AddImageToCardImages < ActiveRecord::Migration
  def self.up
    add_attachment :card_images, :image
  end

  def self.down
    remove_attachment :card_images, :image
  end
end
