class PersonasController < ApplicationController
	before_action :authenticate
	
	def index
		@personas = "active"
		@persona = Persona.new
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@persona = Persona.new
	end

	def create
		if current_project.personas.count < 2
			@persona = Persona.new persona_params.merge(:project_id => current_project.id)
  			if @persona.save
  				Scenario.new(:project_id => current_project.id, :persona_id => @persona.id).save
  				flash[:notice] = "New persona created succesfully!"
  			else
  				flash[:notice] = @persona.errors.full_messages.to_a.join(", ")
  			end
  		else
  			flash[:notice] = "Sorry, you already have two personas"
  		end
  		redirect_to project_personas_path
	end

	def edit
		@persona = current_project.personas.find(params[:id])
	end

	def update
		@persona = current_project.personas.find(params[:id])
      if @persona.update_attributes persona_params
      	 flash[:notice] = "Persona updated successfully!."
      else
      	 flash[:notice] = "Persona could not be updated."
      end
      redirect_to project_personas_path
	end

	def destroy
		@persona = current_project.personas.find(params[:id])
		if @persona.destroy
			 flash[:notice] = "Persona removed successfully!."
		else
			flash[:notice] = "Persona could not be removed."
		end
		redirect_to project_personas_path
	end

	private
	def persona_params
		params.require(:persona).permit(:name,
										:age,
										:location,
      									:gender,
      									:education,
     									:hobbies,
      									:description,
      									:tech_level,
      									:goals,
      									:challenges,
      									:image,
      									)
	end
end