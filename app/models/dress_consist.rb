class DressConsist < ActiveRecord::Base
  has_and_belongs_to_many :dresses
  mount_uploader :picture, PictureUploader
end
