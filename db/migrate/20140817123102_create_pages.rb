class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords
    end
  end
end
