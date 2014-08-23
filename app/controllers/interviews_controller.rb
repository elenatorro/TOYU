class InterviewsController < ApplicationController

	def index
		@interviews = "active"
		render "index"
	end

end