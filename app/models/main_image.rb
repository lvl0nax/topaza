class MainImage < ActiveRecord::Base
  before_create :set_type
  mount_uploader :picture, PictureUploader

  scope :main_histories_images, ->{ where(position: 1).order(:id).first(2) }

  def set_type
    self.position = 1
  end
end
