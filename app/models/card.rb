class Card < ActiveRecord::Base
	belongs_to :project
	belongs_to :sorting_test
	
	validates :name, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }

    validates :color, presence: true,
    				  length: { minimum: 7 },
    				  format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }

end
