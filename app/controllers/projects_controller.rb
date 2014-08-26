class ProjectsController < ApplicationController
	before_filter :redirect_if_logged_in, only: [:index, :new, :create, :confirm]
  	skip_before_filter :authenticate, only: [:index, :new, :create, :confirm]

	def show
		@dashboard = "active"
		@site_requirements_completed = calculate_completed_site_requirements.to_i
		@personas_completed = calculate_completed_personas.to_i
		@scenarios_word_count = calculate_completed_scenarios
		@card_images_list = get_card_sorting_images
		@analysis_duration = get_task_analysis_duration
		@analysis_test_word_count = calculate_completed_task_analysis
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "show"
	end

	def new
	  	if current_project
  			redirect_to project_path
  		else 
  			@project = Project.new
  			render :layout => false
  		end
	end

	def create
		token = SecureRandom.urlsafe_base64(24)
		@project = Project.new(project_params.merge(confirmation_token: token))
  		if @project.save
  			ProjectMailer.signup_confirmation(@project).deliver
  			flash[:notice] = "Check out your email and click on the validation link."
  			redirect_to root_path
  		else
  			flash[:notice] = @project.errors.full_messages.to_a.join(", ")
  			redirect_to new_project_path
  		end
	end

	def confirm
	    project = Project.find_by_confirmation_token(params[:confirmation_token])
	    if project
	      project.confirm!
	      set_session(project)
	      token = SecureRandom.urlsafe_base64(24)

	      SiteRequirement.new(project_id: project.id).save
	      UserRequirement.new(project_id: project.id).save
	      Analysis.new(project_id: project.id).save
	      SortingTest.new(project_id: project.id, url: token).save
	      redirect_to project_path(project.id)
	    else
	      flash[:error] = "This link is invalid, sorry"
	      redirect_to new_project_path
	    end
  end

	private
	def project_params
		params.require(:project).permit(:name, :email, :password, :password_confirmation)
	end

	def calculate_completed_site_requirements
		100 - (current_project.site_requirement.attributes.values.select {|value| value == "" }.count * 10)
	end

	def number_of_personas
		current_project.personas.count
	end

	def calculate_completed_personas
		100 - (current_project.site_requirement.attributes.values.select {|value| value == "" }.count * (100/11))
	end

	def calculate_completed_scenarios
		total_word_length = 0
		current_project.scenarios.each do |scenario|
			unless scenario.description.empty? 
				total_word_length = scenario.description.gsub(/[^-a-zA-Z]/, ' ').split.size
			end
		end
		total_word_length
	end

	def get_card_sorting_images
		current_project.card_images
	end

	def calculate_completed_task_analysis
		unless current_project.analysis.test.empty?
			current_project.analysis.test.gsub(/[^-a-zA-Z]/, ' ').split.size
		end
	end

	def get_task_analysis_duration
		current_project.analysis.duration
	end
end
