ActiveAdmin.register Dress do
  permit_params(:dress => [:body, :title, :seo_title, :seo_description, :seo_keywords, :image => [:name]])

  form :partial => 'admin/dresses/form'


  controller do
    #def find_resource
    #  scoped_collection.friendly.find(params[:id])
    #end

    def update
      #dress = Dress.friendly.find(params[:id])
      @dress = Dress.find(params[:id])
      params[:dress][:image][:name].each {|name| @dress.images << Image.create(name: name)} unless params[:dress][:image].blank?
      respond_to do |format|
        if @dress.update_attributes(title: params[:dress][:title],
                                          body: params[:dress][:body],
                                          seo_description: params[:dress][:seo_description],
                                          seo_title: params[:dress][:seo_title],
                                          seo_keywords: params[:dress][:seo_keywords])
          format.html { redirect_to admin_dressess_path, notice: 'Dress was successfully created.' }
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
