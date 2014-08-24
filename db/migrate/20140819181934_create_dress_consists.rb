class CreateDressConsists < ActiveRecord::Migration
  def change
    create_table :dress_consists do |t|
      t.belongs_to :dress
      t.string :property
      t.string :image
    end
  end
end
