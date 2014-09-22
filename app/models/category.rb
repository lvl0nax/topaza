class Category < ActiveRecord::Base
  has_many :dresses, dependent: :nullify
  mount_uploader :picture, PictureUploader
end
