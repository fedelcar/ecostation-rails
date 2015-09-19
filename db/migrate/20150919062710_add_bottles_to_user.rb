class AddBottlesToUser < ActiveRecord::Migration
  def change
    add_column :users, :bottles, :integer
  end
end
