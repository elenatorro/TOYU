class CardImagesController < ApplicationController
	def index
		@card_images = "active"
		@card_image = CardImage.new
		refresh_dom_with_partial('div#sidebar', '/layouts/sidebar')
		render "index"
	end

	def new
		@card_image = CardImage.new
	end

	def create
		if current_project.card_images.count < 6
			@card_image = CardImage.new card_image_params.merge(:project_id => current_project.id)
  			if @card_image.save
  				flash[:notice] = "New card image created succesfully!"
  			else
  				flash[:notice] = @card_image.errors.full_messages.to_a.join(", ")
  			end
  		else
  			flash[:notice] = "Sorry, you already have six images"
  		end
  		redirect_to project_card_images_path(current_project.id)
	end

	def edit
		@card_image = current_project.card_images.find(params[:id])
	end

	def update
		@card_image = current_project.card_images.find(params[:id])
      if @card_image.update_attributes card_image_params
      	 flash[:notice] = "Image updated successfully!."
      else
      	 flash[:notice] = "The image could not be updated."
      end
      redirect_to project_card_images_path(current_project.id)
	end

	def destroy
		@card_image = current_project.card_images.find(params[:id])
		if @card_image.destroy
			 flash[:notice] = "Image removed successfully!."
		else
			flash[:notice] = "The image could not be removed."
		end
		redirect_to project_card_images_path(current_project.id)
	end

	private
	def card_image_params
		params.require(:card_image).permit(:image)
	end
end
