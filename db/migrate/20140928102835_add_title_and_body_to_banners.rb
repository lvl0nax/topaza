class AddTitleAndBodyToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :title, :string
    add_column :banners, :body, :string
    add_column :banners, :button_name, :string
  end
end
