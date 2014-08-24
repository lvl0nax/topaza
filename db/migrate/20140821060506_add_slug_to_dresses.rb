class AddSlugToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :slug, :string
    add_index :dresses, :slug, unique: true
  end
end
