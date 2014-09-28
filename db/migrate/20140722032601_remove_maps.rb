class RemoveMaps < ActiveRecord::Migration
  def change
    drop_table :maps
  end
end
