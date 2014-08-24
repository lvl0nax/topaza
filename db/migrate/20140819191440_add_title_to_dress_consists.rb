class AddTitleToDressConsists < ActiveRecord::Migration
  def change
    add_column :dress_consists, :title, :string
  end
end
