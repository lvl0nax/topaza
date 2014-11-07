ActiveAdmin.register Dress do
  form partial: 'admin/dresses/form'
  config.sort_order = 'position_asc'
#
  #index do
  #  render 'admin/dresses/index'
  #end
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

  collection_action :sort_wedding, :method => :post do
    @dresses = Category.first.dresses
    @dresses.each do |dress|
      dress.update_attribute('position', params[:sortable].gsub('dress[]=', '').split('&').index(dress.id.to_s))
    end
    render nothing: true
  end

  collection_action :sort_evening, :method => :post do
    @dresses = Category.last.dresses
    @dresses.each do |dress|
      dress.update_attribute('position', params[:sortable].gsub('dress[]=', '').split('&').index(dress.id.to_s))
    end
    render nothing: true
  end

  controller do
    def permitted_params
      params.permit dress: [:body, :title, :seo_title, :seo_description, :seo_keywords]
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      hash = params[:dress]
      @dress = Dress.friendly.find(params[:id])
      @dress.dress_consists.delete_all
      set_relations(@dress, hash)

      respond_to do |format|
        if @dress.update_attributes(permitted_params[:dress])
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully updates.' }
        else
          format.html { render action: 'new', notice: 'Dress not updated.' }
        end
      end
    end

    def create
      hash = params[:dress]
      @dress = Dress.new(permitted_params[:dress])
      set_relations(@dress, hash)

      respond_to do |format|
        if @dress.save
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Dress not created.' }
        end
      end
    end

    def destroy
      dress = Dress.friendly.find(params[:id])
      dress.destroy
      redirect_to admin_dresses_path
    end
    def set_relations(dress, hash)
      dress.images.build(params[:image][:name].map{|str| {name: str} }) if params[:image].present?
      dress.dress_consists << DressConsist.find(hash[:dress_consist][:material].to_i) if hash[:dress_consist][:material].present?
      dress.dress_consists << DressConsist.find(hash[:dress_consist][:embroidery].to_i) if hash[:dress_consist][:embroidery].present?
      dress.category = Category.find(hash[:category_id].to_i)
    end
  end


end
