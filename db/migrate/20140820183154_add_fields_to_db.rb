class AddFieldsToDb < ActiveRecord::Migration
  def change
    add_column :dresses, :created_at, :datetime
    add_column :dresses, :updated_at, :datetime
    add_column :dress_consists, :created_at, :datetime
    add_column :dress_consists, :updated_at, :datetime
  end
end
