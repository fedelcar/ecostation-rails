class RemoveFields < ActiveRecord::Migration
  def change
    remove_column :stations, :position_id
  end
end
