class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :date
      t.integer :user_id
      t.integer :prize_id
      t.timestamps null: false
    end
  end
end
