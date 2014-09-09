ActiveAdmin.register History do
  permit_params :title, :body, :date
  form partial: 'admin/histories/form'
end
