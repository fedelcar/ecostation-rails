class AddSiteAdmin < ActiveRecord::Migration
  def change
    add_column :users, :site_admin, :boolean
  end
end
