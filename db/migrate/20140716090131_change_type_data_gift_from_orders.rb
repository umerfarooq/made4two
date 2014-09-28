class ChangeTypeDataGiftFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :gift
    add_column :orders, :gift, :boolean
  end
end
