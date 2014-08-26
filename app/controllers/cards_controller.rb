class CardsController < ApplicationController
	before_action :authenticate
	
	def show
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.new card_params.merge(:project_id => current_project.id,
										   :sorting_test_id => current_project.sorting_test.id)
		if @card.save
			flash[:notice] = "New card created succesfully!"
		else
			flash[:notice] = @card.errors.full_messages.to_a.join(", ")
		end
		redirect_to project_sorting_tests_path
	end

	def edit
		@card = current_project.sorting_test.cards.find(params[:id])
	end

	def update
		@card = current_project.sorting_test.cards.find(params[:id])
		if @card.update card_params
			flash[:notice] = "Card updated succesfully!"
		else
			flash[:notice] = 'Card could not be updated.'
		end
		redirect_to project_sorting_tests_path
	end

	def destroy
		@card = current_project.sorting_test.cards.find(params[:id])
		if @card.destroy
			flash[:notice] = "Card removed succesfully!"
		else
			flash[:notice] = "Card could not be removed."
		end
		redirect_to project_sorting_tests_path
	end

	private
	def card_params
		params.require(:card).permit(:name, :color)
	end

end