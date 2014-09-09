ActiveAdmin.register DressConsist do
  permit_params :title, :picture, :property

  form partial: 'admin/dress_consists/form'

  show do |dress_consist|
    attributes_table do
      row :title
      row :property
      row :picture do
        image_tag(dress_consist.picture.url(:dress_consist))
      end

    end
    active_admin_comments
  end


end
