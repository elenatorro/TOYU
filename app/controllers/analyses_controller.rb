class AnalysesController < ApplicationController
	before_action :authenticate

	def index
		@analyses = "active"
		@analysis = current_project.analysis
		@new_analysis = Analysis.new
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@analysis = Analysis.new
	end

	def create
		@analysis = Analysis.new analyses_params.merge(:project_id => current_project.id)
		if @analysis.save
			flash[:notice] = "Conduct task analysis successfully created!"
		else
			flash[:notice] = "Conduct task analysis could not be created"
		end
		redirect_to project_analyses_path(current_project.id)
	end

	def destroy
		@analysis = current_project.analysis
		if @analysis
			flash[:notice] = "Conduct task analysis successfully deleted!"
		else
			flash[:notice] = "Conduct task analysis could not be deleted"
		end
		redirect_to project_analyses_path(current_project.id)
	end

	def edit
		@analysis = current_project.analysis
	end

	def update
		@analysis = current_project.analysis
		if @analysis.update analyses_params
			flash[:notice] = "Conduct task analysis successfully updated!"
		else
			flash[:notice] = "Conduct task analysis could not be updated"
		end
		redirect_to project_analyses_path(current_project.id)
	end

	private
	def analyses_params
		params.require(:analysis).permit(:context,
										 :duration,
										 :evaluator,
										 :writer,
										 :test)
	end
end