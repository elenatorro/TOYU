class UserRequirementsController < ApplicationController
	before_action :authenticate
	
	def index
		@user_requirements = "active"
		@user_requirement = UserRequirement.new
		@requirements = current_project.user_requirements
		refresh_dom_with_partial('aside#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@user_requirement = UserRequirement.new
	end

	def create
		@user_requirement = UserRequirement.new user_requirement_params.merge(:project_id => current_project.id)
		if @user_requirement.save
			flash[:notice] = "User requirement successfully created!"
		else
			flash[:notice] = "User requirement could not be created"
		end
		redirect_to project_user_requirements_path
	end

	def destroy
		@user_requirement = current_project.user_requirements.find(params[:id])
		if @user_requirement.destroy
			flash[:notice] = "User requirement successfully deleted!"
		else
			flash[:notice] = "User requirement could not be deleted"
		end
		redirect_to project_user_requirements_path
	end

	def edit
		@user_requirement = current_project.user_requirements.find(params[:id])
	end

	def update
		@user_requirement = current_project.user_requirements.find(params[:id])
		if @user_requirement.update user_requirement_params
			flash[:notice] = "User requirement successfully updated!"
		else
			flash[:notice] = "User requirement could not be updated"
		end
		redirect_to project_user_requirements_path
	end

	private
	def user_requirement_params
		params.require(:user_requirement).permit(:name, :description)
	end
end