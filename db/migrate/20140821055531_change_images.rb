class ChangeImages < ActiveRecord::Migration
  def change
    remove_columns :images, :publication_id, :dress_id
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    add_index :images, :imageable_id
  end
end
