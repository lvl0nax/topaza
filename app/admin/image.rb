ActiveAdmin.register Image do

  show do |image|
    row :name do
      image_tag image.name.url
    end
  end

  member_action :main, method: :get do
    @image = Image.find(params[:id].to_i)
    main_image = model_name(@image).constantize.find(@image.imageable_id).images.where(main: true).first
    main_image.update_attribute('main', false) if main_image.present?
    notice = @image.update_attribute('main', true) ? 'Image was successfully mainly' : 'Image not main'
    set_redirect_path(notice, @image)
  end

  controller do
    def destroy
      @image = Image.find(params[:id].to_i)
      if model_name(@image).constantize == Dress && @image.main
        all_images = model_name(@image).constantize.find(@image.imageable_id).images.pluck(:id)
        all_images.delete(@image.id)
        Image.find(all_images.first).update_attribute('main', true)
      end
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
