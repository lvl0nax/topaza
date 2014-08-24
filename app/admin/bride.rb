ActiveAdmin.register Bride do
  permit_params(:name, :dress_name, :comment, :picture, :approve)

  show do |bride|
    attributes_table do
      row :name if title.present?
      row :dress_name
      row :comment
      row :approve do
        bride.approve ? 'Одобрено' : ' Не прошло модерацию'
      end
      row :picture do
        image_tag(bride.picture_url(:admin_show))
      end
    end
    active_admin_comments
  end
end
