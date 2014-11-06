class AddPositionToImagesAndDresses < ActiveRecord::Migration
  def change
    add_column :images, :position, :integer
    add_column :dresses, :position, :integer
  end
end
