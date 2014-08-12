ActiveAdmin.register Publication do
  permit_params(:publication => [:body, :title, :image => [:name]])

  form :partial => 'publications/form'

  show do |publication|
    attributes_table do
      row :title if title.present?
      row :body
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
    def new
      @publication = Publication.new
    end

    def create
      @publication = Publication.create(title: params[:publication][:title],
                                        body: params[:publication][:body],
                                        seo_description: params[:publication][:seo_description],
                                        seo_title: params[:publication][:seo_title],
                                        seo_keywords: params[:publication][:seo_keywords])
      params[:publication][:image][:name].each {|name| @publication.images << Image.create(name: name)}
      redirect_to admin_publications_path
    end
  end
end
