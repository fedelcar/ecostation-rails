class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.string :description
      t.integer :bottles
      t.timestamps null: false
    end
  end
end
