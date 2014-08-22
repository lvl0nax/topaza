class ChangeImages < ActiveRecord::Migration
  def change
    remove_column :images, :publication_id
    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    add_index :images, :imageable_id
  end
end
