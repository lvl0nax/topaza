ActiveAdmin.register Fitting do

  show do |fitting|
    attributes_table do
      row :name
      row :phone
      row :try_date
      row :try_time do
        fitting.try_time.to_s(:time)
      end
      row :dresses do
        ul do
          fitting.dresses.each do |dress|
            li do
              div do
                link_to dress.title, admin_dress_path(dress)
              end
              div do
                image_tag(dress.images.first.name.url(:admin_show))
              end
            end
          end
        end
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :name
    column :phone
    column :try_date
    column :try_time do |fitting|
      fitting.try_time.to_s(:time)
    end
    actions
  end

end
