class ModifyTours < ActiveRecord::Migration
  def change
    remove_column :tours, :maps_id
    add_column :tours, :latitude, :float
    add_column :tours, :longitude, :float
    add_column :tours, :address, :string
  end
end
