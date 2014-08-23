class SortingTest < ActiveRecord::Base
	belongs_to :project
	has_many :cards
	has_many :card_images
end
