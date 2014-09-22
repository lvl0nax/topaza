ActiveAdmin.register History do
  permit_params :title, :body, :date, :picture
  form partial: 'admin/histories/form'
end
