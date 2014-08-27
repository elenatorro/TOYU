class ScenariosController < ApplicationController
	before_action :authenticate

	def index
		@scenarios = "active"
		@scenario = Scenario.new
		refresh_dom_with_partial('aside#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@scenario = Scenario.new
	end

	def edit
		@scenario = current_project.scenarios.find(params[:id])
	end

	def update
		@scenario = current_project.scenarios.find(params[:id])
      if @scenario.update_attributes scenario_params
      	flash[:notice] = "Scenario updated successfully!."
      else
      	flash[:notice] = "Scenario could not be updated."
      end
      	redirect_to project_scenarios_path
	end

	def destroy
	end

	private
	def scenario_params
		params.require(:scenario).permit(:description, :persona_id)
	end
end