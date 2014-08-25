class SortingTestsController < ApplicationController
	
	def index
		authenticate
		@sorting_tests = "active"
		@cards = current_project.sorting_test.cards
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def edit
		authenticate
		sorting_test = current_project.sorting_test
	end

	def update
		authenticate
		sorting_test = current_project.sorting_test
		if sorting_test.update sorting_test_params
			flash[:notice] = "Sorting test updated successfully!"
		else
			flash[:notice] = "Sorting test could not be updated"
		end
			redirect_to project_sorting_tests_path(current_project.id)
	end


	def confirm_test
		sorting_test = SortingTest.find_by_url(params[:url])
		@cards = sorting_test.cards
		render "confirm_test", :layout => false
	end

	def show
		sorting_test = SortingTest.find_by_url(params[:url])
		if sorting_test.password = params[:password]
			rredirect_to project_sorting_test_path, :layout => false
		else
			flash[:notice] = "Password or url invalid"
			redirect_to confirm_test_path, :layout => false
		end
	end

	private
	def sorting_test_params
		params.require(:sorting_test).permit(:url, :password)
	end
end