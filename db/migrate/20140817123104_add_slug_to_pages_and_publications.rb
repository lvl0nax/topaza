class AddSlugToPagesAndPublications < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string, unique: true
    add_column :publications, :slug, :string, unique: true
  end
end
