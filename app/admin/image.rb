ActiveAdmin.register Image do

  controller do
    def destroy
      @image = Image.find(params[:id])
      @publication = @image.publication
      if @image.destroy
        redirect_to edit_admin_publication_path(@publication), notice: 'Image was successfully destroyed'
      else
        redirect_to edit_admin_publication_path(@publication), notice: 'Image not destroyed'
      end
    end

  end


end
