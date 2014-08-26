class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :project_not_authorized

  #helpers
  helper_method :authenticate
  helper_method :current_project

  def authenticate
    redirect_to root_path, alert: "You must be logged in" if current_project.nil?
  end

  def set_session(project)
    session[:token] = project.set_session_token
  end

  def current_project
    if session[:token]
      @current_project ||= Project.find_by_session_token(session[:token])
    end
  end
  

  private
  def redirect_if_logged_in
    if current_project
      flash[:notice] = "You are already logged in!"
      redirect_to project_path
    end
  end

  def project_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = "You cannot perform the action #{exception.query} according to the #{policy_name}."
    redirect_to(request.referrer || root_path)
  end
end
