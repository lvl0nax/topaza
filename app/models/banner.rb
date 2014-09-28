class Banner < ActiveRecord::Base
  serialize :positions, Array
  mount_uploader :picture, PictureUploader

  scope :home, ->{where('positions like ?', '%1%')}
  scope :publication, ->{where('positions like ?', '%2%')}
  scope :dress, ->{where('positions like ?', '%3%')}
  scope :discount, ->{where('positions like ?', '%4%')}

end