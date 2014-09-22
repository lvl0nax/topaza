ActiveAdmin.register Category do

  permit_params :title, :picture

  form partial: 'admin/categories/form'



end
