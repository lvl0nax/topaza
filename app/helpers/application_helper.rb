module ApplicationHelper
  def dress_select(f, property, dress)
    f.select :material, options_from_collection_for_select(DressConsist.where(property: property), :id, :title, dress.dress_consists.where(property: property).first.id), :include_blank => false, label: false
  end
end
