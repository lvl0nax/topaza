class Publication < ActiveRecord::Base
  validates_presence_of :title, :body, :short_body, :seo_title, :seo_description, :seo_keywords, :images
  validates_associated :images
  has_many :images
  #accepts_nested_attributes_for :images, allow_destroy: true
end
