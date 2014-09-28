class DeleteAddressFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :address1
    remove_column :messages, :address2
  end
end
