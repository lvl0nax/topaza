class Banner < ActiveRecord::Base
  serialize :positions, Array
  mount_uploader :picture, PictureUploader
end