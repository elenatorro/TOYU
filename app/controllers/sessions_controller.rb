class SessionsController < ApplicationController
	before_filter :redirect_if_logged_in, only: [:new, :create]
  skip_before_filter :authenticate, only: [:new, :create]

	def new
    
	end

	def create
    project = Project.find_by_name(session_params[:name])
    if project && project.confirmed && authenticate(project, session_params[:password])
      set_session(project)
      redirect_to project_path(project.id)

    elsif project && !project.confirmed     # User has not confirmed his account yet and can not log in (customer support has to handle typos in emails on signup)
      project.update_attributes!(confirmation_token: SecureRandom.urlsafe_base64(24))   # we create a new token
      ProjectMailer.signup_confirmation(project).deliver                 # before sending a new confirmation email
      flash[:notice] = "You have to confirm your email to activate your project, please check your inbox"
      redirect_to root_path

    else
      flash[:notice] = "Invalid name or password. Try it again."
      redirect_to root_path
    end
  end

  def destroy
    current_project.update_attributes(session_token: nil)
    session[:token] = nil
    flash[:notice] = "You logged out successfully!"
    redirect_to root_path
  end

  private
    def session_params
      params.permit(:name, :email, :password)
    end

    def authenticate(project, password)
    if project && project.password_hash == BCrypt::Engine.hash_secret(password, project.password_salt)
      true
    else
      false
    end
  end
end
