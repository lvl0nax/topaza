class CreateDiscount < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :title
      t.text :body
      t.string :picture
      t.string :button_name
      t.string :button_url
    end
  end
end
