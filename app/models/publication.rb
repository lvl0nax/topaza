class Publication < ActiveRecord::Base
  validates_presence_of :title, :body, :short_body, :seo_title, :seo_description, :seo_keywords, :images
  validates_associated :images

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, as: :imageable, dependent: :destroy

  scope :next, ->(id){where('id > ?', id).first}
  scope :prev, ->(id){where('id < ?', id).first}
end
