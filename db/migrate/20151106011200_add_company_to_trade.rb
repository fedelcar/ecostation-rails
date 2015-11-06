class AddCompanyToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :company_id, :integer
  end
end
