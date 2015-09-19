class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :company_id
      t.integer :position_id
      t.timestamps null: false
    end
  end
end
