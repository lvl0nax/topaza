ActiveAdmin.register Image do

  show do |image|
    row :name do
      image_tag image.name.url
    end
  end

  controller do
    def destroy
      @image = Image.find(params[:id].to_i)
      model = @image.imageable_type.downcase.pluralize
      object_model_id = @image.imageable_id
      notice = @image.destroy ? 'Image was successfully destroyed' : 'Image not destroyed'
      redirect_to "/admin/#{model}/#{object_model_id}/edit", notice: "#{notice}"
    end
  end

end
