class HomeController < ApplicationController

  def index
  	if current_project
  		redirect_to projects_path(current_project.id) 
  	else 
  		render "index", :layout => false
  	end
  end

  def error
  	render "error", :layout => false
  end
end