class RenameImageToPictureInDressConsists < ActiveRecord::Migration
  def change
    rename_column :dress_consists, :image, :picture
  end
end
