module ApplicationHelper
  def dress_select(f, property, dress)
    f.select property.downcase.to_sym, options_from_collection_for_select(DressConsist.where(property: property), :id, :title, default_dress_consists(dress, property)), include_blank: true, label: false
  end

  def default_dress_consists(dress, property)
    dress_consists = dress.dress_consists.where(property: property).first
    dress_consists.id if dress_consists.present?
  end

  def consists_height(dress)
    case dress.dress_consists.size
      when 0 then 390
      when 1 then 590
      else 790
    end
  end

  def text_subscribe_banner
    if controller_name == 'brides'
      'Читайте о нас и наших невестах'
    else
      'ПОДПИСЫВАЙТЕСЬ И СЛЕДИТЕ ЗА ОБНОВЛЕНИЯМИ'
    end
  end

  def title(page_title)
    content_for(:title) { page_title.to_s + ' - Topaza Pella' }
  end

  def meta_keywords(content)
    content_for(:keywords) { content.to_s }
  end

  def meta_description(content)
    if content.present?
      content_for(:description) { strip_tags(content.truncate(150, separator: ' ').to_s) }
    end
  end

end

