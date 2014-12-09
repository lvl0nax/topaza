class Image < ActiveRecord::Base
  mount_uploader :name, ImageUploader
  belongs_to :imageable, polymorphic: true
  acts_as_list

  default_scope { order('position') }

  scope :main, ->{ where(main: true).exists? ? where(main: true).first : first }

  after_update :set_image_as_main, :if => Proc.new { |img| img.main_changed? }
  private
  def set_image_as_main
    self.imageable.images.where.not(id: self.id).update_all(main: false) if self.imageable
  end

end
