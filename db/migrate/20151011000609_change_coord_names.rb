class ChangeCoordNames < ActiveRecord::Migration
  def change
    rename_column :positions, :latitude, :lat
    rename_column :positions, :longitude, :lng
  end
end
