class Dress < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :dress_consists, dependent: :nullify
  belongs_to :category

  validates_presence_of :images
  before_save :set_main_image

  def set_main_image
    images.first.update_attribute('main', true)
  end
end
