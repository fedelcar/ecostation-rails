class AddDefaultValues < ActiveRecord::Migration
  def change
    change_column :users, :bottles, :integer, default: 0, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :encrypted_password, :string, null: false

    change_column :transactions, :user_id, :integer, null: false
    change_column :transactions, :station_id, :integer, null: false
    change_column :transactions, :bottles, :integer, default: 1, null: false

    change_column :trades, :user_id, :integer, null: false
    change_column :trades, :prize_id, :integer, null: false

    change_column :stations, :company_id, :integer, null: false
    change_column :stations, :name, :string, default: 'NN', null: false

    change_column :prizes, :name, :string, default: 'Premio Genérico', null: false
    change_column :prizes, :company_id, :integer, null: false
    change_column :prizes, :bottles, :integer, null: false

    change_column :positions, :longitude, :float, default: 0, null: false
    change_column :positions, :latitude, :float, default: 0, null: false
    change_column :positions, :station_id, :integer, null: false

    change_column :companies, :legal_name, :string, null: false
    change_column :companies, :fantasy_name, :string, null: false
    change_column :companies, :cuit, :string, null: false
  end
end
