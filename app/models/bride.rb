class Bride < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  scope :approved, -> { where(approve: true) }
end
