class ChangeTypeDataCerticateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :certicate
    add_column :orders, :certicate, :boolean
  end
end
