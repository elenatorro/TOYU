class SortingTestsController < ApplicationController
	before_action :authenticate
	
	def index
		@sorting_tests = "active"
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

end