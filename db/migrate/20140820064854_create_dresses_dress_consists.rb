class CreateDressesDressConsists < ActiveRecord::Migration
  def change
    create_table :dress_consists_dresses do |t|
      t.belongs_to :dress, index: true
      t.belongs_to :dress_consist, index: true
    end
  end
end
