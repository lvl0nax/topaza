class Page < ActiveRecord::Base
  validates_presence_of :title, :body, :seo_title, :seo_description, :seo_keywords

  extend FriendlyId
  friendly_id :title, use: :slugged
end