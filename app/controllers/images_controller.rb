class ImagesController < ApplicationController
  def destroy
    @image = Image.find(params[:id])
    @publication = @image.publication
    @image.destroy
    redirect_to edit_admin_publication_path(@publication)
  end
end