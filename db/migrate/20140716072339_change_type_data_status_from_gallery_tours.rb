class ChangeTypeDataStatusFromGalleryTours < ActiveRecord::Migration
  def change
    remove_column :gallery_tours, :status
    add_column :gallery_tours, :status, :boolean
  end
end
