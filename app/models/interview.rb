class Interview < ActiveRecord::Base
	belongs_to :project
	has_many :questions

	validates :user, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }
    validates :interviwer, presence: true, 
					 length: { maximum: 20 }, 
					 format: { with: /\A[a-zA-Z0-9' ']*\z/ }
    validates :time, presence: true, numericality: true
end
