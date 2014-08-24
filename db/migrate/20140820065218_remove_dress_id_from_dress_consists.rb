class RemoveDressIdFromDressConsists < ActiveRecord::Migration
  def change
    remove_column :dress_consists, :dress_id
  end
end
