module ApplicationHelper
  def dress_select(f, property, dress)
    f.select property.downcase.to_sym, options_from_collection_for_select(DressConsist.where(property: property), :id, :title, set_default(dress, property)), :include_blank => false, label: false
  end

  def set_default(dress, property)
    dress = dress.dress_consists.where(property: property).first
    dress.id if dress.present?
  end
end
