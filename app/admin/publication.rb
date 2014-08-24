ActiveAdmin.register Publication do
  form partial: 'admin/publications/form'

  show do |publication|
    attributes_table do
      row :title if title.present?
      row :body
      row :short_body
      row :seo_title
      row :seo_description
      row :seo_keywords
      row :image do
        ul do
          publication.images.each do |image|
            li do
              image_tag(image.name.url(:admin_show))
            end
          end
        end
      end

    end
    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit publication: [:body, :title, :short_body, :seo_title, :seo_description, :seo_keywords]
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      hash = params[:publication]
      @publication = Publication.friendly.find(params[:id])
      set_short_body(hash[:body], hash[:short_body])
      add_images(@publication, hash[:image])

      respond_to do |format|
        if @publication.update_attributes(permitted_params[:publication])
          format.html { redirect_to admin_publications_path, notice: 'Publication was successfully updated.' }
        else
          format.html { render action: 'new', notice: 'Publication not updated.' }
        end
      end
    end

    def create
      hash = params[:publication]
      set_short_body(hash[:body], hash[:short_body])
      @publication = Publication.new(permitted_params[:publication])
      add_images(@publication, hash[:image])

      respond_to do |format|
        if @publication.save
          format.html { redirect_to admin_publications_path, notice: 'Publication was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Publication not created.' }
        end
      end
    end

    def set_short_body(body, short_body)
      params[:publication][:short_body] = ActionView::Base.full_sanitizer.sanitize(body).split('. ')[0..2].join('. ') if short_body.blank?
    end

    def add_images(object, image)
      image[:name].each {|name| object.images << Image.create(name: name)} unless image.blank?
    end
  end
end
