class AddPictureToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :picture, :string
  end
end
