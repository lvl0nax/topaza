ActiveAdmin.register Discount do
  permit_params :title, :body, :button_name, :button_url, :picture

  form partial: 'admin/discounts/form'

  show do |discount|
    attributes_table do
      row :title
      row :body
      row :button_name
      row :button_url
      row :picture do
        image_tag(discount.picture.url(:discount))
      end

    end
    active_admin_comments
  end
end
