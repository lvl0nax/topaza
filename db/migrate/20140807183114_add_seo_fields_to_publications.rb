class AddSeoFieldsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :seo_title, :string
    add_column :publications, :seo_description, :string
    add_column :publications, :seo_keywords, :string
  end
end
