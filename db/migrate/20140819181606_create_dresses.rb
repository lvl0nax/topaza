class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.string :title
      t.text :body
    end
  end
end
