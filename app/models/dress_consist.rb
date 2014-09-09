class DressConsist < ActiveRecord::Base
  has_and_belongs_to_many :dresses, dependent: :nullify
  mount_uploader :picture, PictureUploader
end
