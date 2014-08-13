class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.belongs_to :publication
      t.timestamps
    end
  end
end
