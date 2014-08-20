ActiveAdmin.register DressConsist do
  permit_params :title, :image, :property

  form do |f|
    f.inputs 'Title' do
      f.input :title, label: false
    end
    f.inputs 'Image' do
      f.input :image, label: false, as: :file
    end
    f.inputs 'Property' do
      f.input :property, as: :select, :collection => %w(Material Embroidery), :include_blank => false
    end
    f.actions
  end

  show do |dress_consist|
    attributes_table do
      row :title
      row :property
      row :image do
        image_tag(dress_consist.image.url(:dress_consist))
      end

    end
    active_admin_comments
  end


end
