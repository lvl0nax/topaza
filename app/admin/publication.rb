ActiveAdmin.register Publication do
  permit_params(:publication => [:body, :title, :image => [:name, :_destroy]])

  form :partial => 'publications/form'

  controller do
    def new
      @publication = Publication.new
      @image = Image.new
    end

    def create
      @publication = Publication.create(title: params[:publication][:title], body: params[:publication][:body])
      params[:publication][:image][:name].each { |name| @publication.images << Image.create(name: name) }
      redirect_to admin_publications_path
    end
  end
end
