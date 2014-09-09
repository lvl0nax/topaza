ActiveAdmin.register Banner do
  permit_params :picture, :url, positions: []
  form partial: 'admin/banners/form'
end
