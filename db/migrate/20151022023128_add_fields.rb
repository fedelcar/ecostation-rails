class AddFields < ActiveRecord::Migration
  def change
    add_column :users, :remember_created_at, :datetime
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
  end
end
