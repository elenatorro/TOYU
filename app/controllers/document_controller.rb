class DocumentController < ApplicationController

  def index
  	if current_project
      @site_requirements = get_site_requirements
      @personas = get_personas
      @scenarios = get_scenarios
      @card_sorting_images = get_card_sorting_images
      @conduct_task_analysis = get_conduct_task_analysis
      @use_cases = get_use_cases
      @user_requirements = get_user_requirements
  		render "index", :layout => false
  	else 
  		redirect_to root_path
  	end
  end

  private
  def get_site_requirements
    requirements = [current_project.site_requirement.requirement1,
                    current_project.site_requirement.requirement2,
                    current_project.site_requirement.requirement3,
                    current_project.site_requirement.requirement4,
                    current_project.site_requirement.requirement5,
                    current_project.site_requirement.requirement6,
                    current_project.site_requirement.requirement7,
                    current_project.site_requirement.requirement8,
                    current_project.site_requirement.requirement9,
                    current_project.site_requirement.requirement10]
    
  end

  def get_personas
    current_project.personas
  end

  def get_card_sorting_images
    current_project.card_images
  end

  def get_conduct_task_analysis
    current_project.analysis
  end

  def get_use_cases
    current_project.use_cases
  end

  def get_user_requirements
    current_project.user_requirements
  end

  def get_scenarios
    current_project.scenarios
  end
end