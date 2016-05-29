class CreateVouchersTable < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.integer :user_id
      t.datetime :created_at
      t.datetime :consumed_at
      t.boolean :consumed
      t.string :code
      t.integer :bottles
      t.float :total
    end
  end
end
