class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.float :latitude
      t.float :longitude
      t.date :date
      t.string :description
      t.timestamps null: false
    end
  end
end
