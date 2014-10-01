class AddRelationWithDressAndFitting < ActiveRecord::Migration
  def change
    create_table :dresses_fittings, id: false do |t|
      t.belongs_to :fitting
      t.belongs_to :dress
    end
  end
end
