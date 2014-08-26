class SiteRequirementsController < ApplicationController
	before_action :authenticate
	
	def index
		@site_requirements = "active"
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def edit
		@site_requirement = current_project.site_requirement
	end

	def update
	  @site_requirement = current_project.site_requirement
      if @site_requirement.update_attributes site_requirements_params
      	 flash[:notice] = "Site requirements updated successfully!."
      else
      	 flash[:notice] = "The requirements could not be updated."
      end
      redirect_to project_site_requirements_path
	end

	private
	def site_requirements_params
		params.require(:site_requirement).permit(:requirement1,
												 :requirement2,
												 :requirement3,
												 :requirement4,
												 :requirement5,
												 :requirement6,
												 :requirement7,
												 :requirement8,
												 :requirement9,
												 :requirement10)
	end
end