class Discount < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates_presence_of :title, :body, :button_name, :button_url, :picture
end
