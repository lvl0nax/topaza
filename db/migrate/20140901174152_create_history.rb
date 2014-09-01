class CreateHistory < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.date :date
      t.string :title
      t.text :body
    end
  end
end
