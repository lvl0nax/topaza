class Image < ActiveRecord::Base
  mount_uploader :name, ImageUploader
  belongs_to :imageable, polymorphic: true

  default_scope { order('id') }

  scope :main, ->{ where(main: true).exists? ? where(main: true).first : first }

  after_update :set_image_as_main, :if => Proc.new { |img| img.main_changed? }
  private
  def set_image_as_main
    self.imageable.images.where.not(id: self.id).update_all(main: false)
  end

end
