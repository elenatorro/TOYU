class Question < ActiveRecord::Base
	belongs_to :interview
	belongs_to :project

	validates question, presence: true
	validates answer, presence: true
end
