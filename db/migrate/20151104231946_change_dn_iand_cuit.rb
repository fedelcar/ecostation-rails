class ChangeDnIandCuit < ActiveRecord::Migration
  def change
    remove_column :users, :dni
    remove_column :companies, :cuit
    add_column :users, :dni, :integer
    add_column :companies, :cuit, :integer
  end
end
