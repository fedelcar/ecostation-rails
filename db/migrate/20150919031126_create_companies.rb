class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :fantasy_name
      t.string :cuit
      t.timestamps null: false
    end
  end
end
