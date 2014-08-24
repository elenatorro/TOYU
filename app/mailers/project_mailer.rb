class ProjectMailer < ActionMailer::Base
  default from: "toyu.herokuapp.com"

  def signup_confirmation(project)
    @email    = project.email
    @link     = project_activation_link(project)
    @greeting = "Thank you for creating a new project!"

    mail to: @email, subject: "Welcome to TOYU"
  end

  private
    def project_activation_link(project)
      token     = project.confirmation_token
      base_url  = "toyu.herokuapp.com"
      path      = confirm_projects_path
      "#{base_url}#{path}?confirmation_token=#{token}"
    end

    def projects_link
      base_url  = "toyu.herokuapp.com"
      path      = projects_path
      "#{base_url}#{path}"
    end

end