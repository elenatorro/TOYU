class UseCasesController < ApplicationController
	before_action :authenticate
	
	def index
		@use_cases = "active"
		@use_case = UseCase.new
		@cases = current_project.use_cases
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@use_case = UseCase.new
	end

	def create
		@use_case = UseCase.new use_cases_params.merge(:project_id => current_project.id)
		if @use_case.save
			flash[:notice] = "Use case successfully created!"
		else
			flash[:notice] = "Use case could not be created"
		end
		redirect_to project_use_cases_path(current_project.id)
	end

	def destroy
		@use_case = current_project.use_cases.find(params[:id])
		if @use_case.destroy
			flash[:notice] = "Use case successfully deleted!"
		else
			flash[:notice] = "Use case could not be deleted"
		end
		redirect_to project_use_cases_path(current_project.id)
	end

	def edit
		@use_case = current_project.use_cases.find(params[:id])
	end

	def update
		@use_case = current_project.use_cases.find(params[:id])
		if @use_case.update use_cases_params
			flash[:notice] = "Use case successfully updated!"
		else
			flash[:notice] = "Use case could not be updated"
		end
		redirect_to project_use_cases_path(current_project.id)
	end

	private
	def use_cases_params
		params.require(:use_case).permit(:name, 
										 :descriptiont,
      									 :field_of_application,
      									 :actors,
      									 :precondition,
      									 :trigger,
      									 :basic_flow,
      									 :alternate_flow,
      									 :postcondition)
	end
end
