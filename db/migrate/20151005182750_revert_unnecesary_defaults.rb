class RevertUnnecesaryDefaults < ActiveRecord::Migration
  def change
    change_column :positions, :station_id, :integer, null: true
  end
end
