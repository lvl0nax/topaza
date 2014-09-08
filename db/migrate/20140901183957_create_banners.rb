class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :picture
      t.string :positions
      t.string :url
    end
  end
end
