class Dress < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :dress_consists, dependent: :nullify
  has_and_belongs_to_many :dresses, dependent: :nullify
  belongs_to :category

  before_save :set_main_image

  scope :evening, ->{where(category_id: Category.where(title: 'Свадебная коллекция'))}
  scope :bridal, ->{where(category_id: Category.where(title: 'Вечерняя коллекция'))}

  def set_main_image
    images.first.update_attribute('main', true)
  end
end
