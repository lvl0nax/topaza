class Dress < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, as: :imageable
  has_and_belongs_to_many :dress_consists
  belongs_to :category

  def main_image
    images.where(main: true).order(:main)
  end
end