class AddMainToImages < ActiveRecord::Migration
  def change
    add_column :images, :main, :boolean, default: false
  end
end
