class ProjectsController < ApplicationController
	before_filter :redirect_if_logged_in, only: [:index, :new, :create, :confirm]
  	skip_before_filter :authenticate, only: [:index, :new, :create, :confirm]

	def show
		@dashboard = "active"
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "show"
	end

	def new
	  	if current_project
  			redirect_to projects_path(current_project.id)
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
	      SiteRequirement.new(project_id: project.id).save
	      UserRequirement.new(project_id: project.id).save
	      Analysis.new(project_id: project.id).save
	      SortingTest.new(project_id: project.id).save
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

end
