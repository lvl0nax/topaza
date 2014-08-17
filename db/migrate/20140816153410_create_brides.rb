class CreateBrides < ActiveRecord::Migration
  def change
    create_table :brides do |t|
      t.string :name
      t.string :dress_name
      t.string :comment
      t.string :picture
      t.boolean :approve, default: false, null: false

      t.timestamps
    end
  end
end
