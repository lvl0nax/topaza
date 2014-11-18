# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [466, 680]
  end

  version :admin_show, from_version: :thumb do
    process resize_to_fit: [150, 150]
  end

  version :discount, :if => :is_discount? do
    process resize_to_fill: [467, 435]
  end

  version :dress_consist, :if => :is_dress_consist? do
    process resize_to_fill: [468, 200]
  end

  version :banner, :if => :is_banner? do
    process resize_to_fill: [300, 50]
  end

  version :history, :if => :is_history? do
    process resize_to_fill: [467, 435]
    end

  version :category, :if => :is_category? do
    process resize_to_fill: [467, 600]
  end

  version :history_main_image, :if => :is_main_image? do
    process resize_to_fill: [451, 420]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  protected
  def is_discount? picture
    model.class.name == 'Discount'
  end

  def is_dress_consist? picture
    model.class.name == 'DressConsist'
  end

  def is_banner? picture
    model.class.name == 'Banner'
    end

  def is_history? picture
    model.class.name == 'History'
    end

  def is_category? picture
    model.class.name == 'Category'
  end

  def is_main_image? picture
    model.class.name == 'MainImage'
  end

end
