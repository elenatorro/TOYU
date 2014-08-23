class UserRequirement < ActiveRecord::Base
	belongs_to :project

	validates :name, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }

end
