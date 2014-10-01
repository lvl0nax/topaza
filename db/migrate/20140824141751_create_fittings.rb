class CreateFittings < ActiveRecord::Migration
  def change
    create_table :fittings do |t|
      t.date :try_date
      t.time :try_time
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
