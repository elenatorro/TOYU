class HomeController < ApplicationController

  def index
  	if current_project
  		redirect_to project_path
  	else 
  		render "index", :layout => false
  	end
  end

  def error
  	render "error", :layout => false
  end
end