class RemoveColumnFromTours < ActiveRecord::Migration
  def change
    remove_column :tours, :include_id
    remove_column :tours, :we_love_id
    remove_column :tours, :address
  end
end
