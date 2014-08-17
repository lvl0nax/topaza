ActiveAdmin.register Publication do
  permit_params(:publication => [:body, :title, :short_body, :seo_title, :seo_description, :seo_keywords, :image => [:name]])

  form :partial => 'admin/publications/form'

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
    publication.images.each do |image|
      image_tag(image.name.url(:admin_show))
    end
    active_admin_comments
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      @publication = Publication.friendly.find(params[:id])
      short_body = if params[:publication][:short_body].blank?
                     ActionView::Base.full_sanitizer.sanitize(params[:publication][:body]).split('. ')[0..4].join('. ')
                   else
                     params[:publication][:short_body]
                   end
      params[:publication][:image][:name].each {|name| @publication.images << Image.create(name: name)} unless params[:publication][:image].blank?
      respond_to do |format|
        if @publication.update_attributes(title: params[:publication][:title],
                                          body: params[:publication][:body],
                                          short_body: short_body,
                                          seo_description: params[:publication][:seo_description],
                                          seo_title: params[:publication][:seo_title],
                                          seo_keywords: params[:publication][:seo_keywords])
          format.html { redirect_to admin_publications_path, notice: 'Publication was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Publication not created.' }
        end
      end
    end

    def create
      short_body = if params[:publication][:short_body].blank?
        ActionView::Base.full_sanitizer.sanitize(params[:publication][:body]).split('. ')[0..4].join('. ')
      else
        params[:publication][:short_body]
      end
      @publication = Publication.new(title: params[:publication][:title],
                                        body: params[:publication][:body],
                                        short_body: short_body,
                                        seo_description: params[:publication][:seo_description],
                                        seo_title: params[:publication][:seo_title],
                                        seo_keywords: params[:publication][:seo_keywords])
      params[:publication][:image][:name].each {|name| @publication.images << Image.create(name: name)} unless params[:publication][:image].blank?

      respond_to do |format|
        if @publication.save
          format.html { redirect_to admin_publications_path, notice: 'Publication was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Publication not created.' }
        end
      end
    end
  end
end
