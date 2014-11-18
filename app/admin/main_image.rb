ActiveAdmin.register MainImage do

  permit_params(:picture, :position)

  form do |f|
    f.inputs 'Картинка' do
      f.input :picture, label: false
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :picture do |img|
      image_tag img.picture_url(:admin_show)
    end
    actions
  end
end
