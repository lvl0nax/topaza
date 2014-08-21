class AddCategoryIdToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :category_id, :integer
  end
end
