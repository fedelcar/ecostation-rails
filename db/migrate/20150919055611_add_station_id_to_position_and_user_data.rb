class AddStationIdToPositionAndUserData < ActiveRecord::Migration
  def change
    add_column :positions, :station_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dni, :string
  end
end
