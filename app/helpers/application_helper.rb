module ApplicationHelper
  def dress_select(f, property, dress)
    f.select property.downcase.to_sym, options_from_collection_for_select(DressConsist.where(property: property), :id, :title, dress.dress_consists.where(property: property).first.id), :include_blank => false, label: false
  end

  def set_default(dress)
    dress.dress_consists.where(property: property).first.id if dress.dress_consists.present?
  end
end
