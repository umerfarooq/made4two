class RenameMapsToMapsIdFromTours < ActiveRecord::Migration
  def change
    remove_column :tours, :maps
    add_column :tours, :maps_id, :integer
  end
end
