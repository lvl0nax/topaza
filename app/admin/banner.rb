ActiveAdmin.register Banner do
  permit_params :button_name, :title, :body, :picture, :url, positions: []
  form partial: 'admin/banners/form'
  show do
    render 'admin/banners/show'
  end
end
