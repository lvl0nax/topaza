class CreateMainImages < ActiveRecord::Migration
  def change
    create_table :main_images do |t|
      t.string :picture
      t.integer :position

      t.timestamps
    end
  end
end
