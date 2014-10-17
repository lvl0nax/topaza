ActiveAdmin.register Image do

  show do |image|
    row :name do
      image_tag image.name.url
    end
  end

  member_action :main, method: :get do
    @image = Image.find(params[:id].to_i)
    notice = @image.update_attribute('main', true) ? 'Главное изображение успешно изменено' : 'Изображение не главное'
    set_redirect_path(notice, @image)
  end

  controller do
    def destroy
      @image = Image.find(params[:id].to_i)
      notice = @image.destroy ? 'Image was successfully destroyed' : 'Image not destroyed'
      set_redirect_path(notice, @image)
    end

    private
    def model_name(image)
      image.imageable_type
    end

    def set_redirect_path(notice, image)
      model = model_name(image).downcase.pluralize
      object_model_id = image.imageable_id
      redirect_to "/admin/#{model}/#{object_model_id}/edit", notice: "#{notice}"
    end

  end

end
