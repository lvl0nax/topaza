class AddFieldsToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :seo_title, :string
    add_column :dresses, :seo_description, :string
    add_column :dresses, :seo_keywords, :string
  end
end
