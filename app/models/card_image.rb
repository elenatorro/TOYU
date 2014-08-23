class CardImage < ActiveRecord::Base
	belongs_to :project
	belongs_to :sorting_test
end
