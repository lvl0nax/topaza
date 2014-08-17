ActiveAdmin.register Page do
  permit_params :body, :title, :seo_title, :seo_description, :seo_keywords

  form :partial => 'admin/pages/form'

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end
