ActiveAdmin.register Dress do
  permit_params(:dress => [:body, :title, :seo_title, :seo_description, :seo_keywords, :image => [:name], :dress_consist => [:material, :embroidery]])

  form :partial => 'admin/dresses/form'

  show do |dress|
    attributes_table do
      row :title
      row :body
      row :slug
      row :seo_title
      row :seo_description
      row :seo_keywords
      row :image do
        ul do
          dress.images.each do |image|
            li do
              image_tag(image.name.url(:admin_show))
            end
          end
        end
      end
    end
    panel 'Category' do
      attributes_table_for dress.category do
        rows :title
      end
    end
    active_admin_comments
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      @dress = Dress.friendly.find(params[:id])
      params[:dress][:image][:name].each {|name| @dress.images << Image.create(name: name)} unless params[:dress][:image].blank?
      @dress.dress_consists.delete_all
      @dress.dress_consists << DressConsist.find(params[:dress][:dress_consist][:material].to_i)
      @dress.dress_consists << DressConsist.find(params[:dress][:dress_consist][:embroidery].to_i)
      @dress.category_id = params[:dress][:category][:category_id].to_i
      respond_to do |format|
        if @dress.update_attributes(title: params[:dress][:title],
                                          body: params[:dress][:body],
                                          seo_description: params[:dress][:seo_description],
                                          seo_title: params[:dress][:seo_title],
                                          seo_keywords: params[:dress][:seo_keywords])
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Dress not created.' }
        end
      end
    end

    def create
      @dress = Dress.new(title: params[:dress][:title],
                         body: params[:dress][:body],
                         seo_description: params[:dress][:seo_description],
                         seo_title: params[:dress][:seo_title],
                         seo_keywords: params[:dress][:seo_keywords])
      params[:dress][:image][:name].each {|name| @dress.images << Image.create(name: name)} unless params[:dress][:image].blank?
      @dress.dress_consists << DressConsist.find(params[:dress][:dress_consist][:material].to_i)
      @dress.dress_consists << DressConsist.find(params[:dress][:dress_consist][:embroidery].to_i)
      @dress.category_id = params[:dress][:category][:category_id].to_i

      respond_to do |format|
        if @dress.save
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Dress not created.' }
        end
      end
    end
  end


end
