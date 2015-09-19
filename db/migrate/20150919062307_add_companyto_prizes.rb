class AddCompanytoPrizes < ActiveRecord::Migration
  def change
    add_column :prizes, :company_id, :integer
  end
end
