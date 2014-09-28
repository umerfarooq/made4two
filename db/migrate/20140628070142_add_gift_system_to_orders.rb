class AddGiftSystemToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :gift, :integer, default: 0
    add_column :orders, :firstname, :string
    add_column :orders, :lastname, :string
    add_column :orders, :message, :text
    add_column :orders, :certicate, :string
    add_column :orders, :email, :string
  end
end
