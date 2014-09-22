class History < ActiveRecord::Base
  #default_scope {order(:date)}
  mount_uploader :picture, PictureUploader
  validates_presence_of :title, :body, :picture
end