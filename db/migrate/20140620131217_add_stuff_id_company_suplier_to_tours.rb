class AddStuffIdCompanySuplierToTours < ActiveRecord::Migration
  def change
    add_column :tours, :stuff_id, :integer
    add_column :tours, :supplier_company, :string
  end
end
