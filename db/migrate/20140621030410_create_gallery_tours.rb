class CreateGalleryTours < ActiveRecord::Migration
  def change
    create_table :gallery_tours do |t|
      t.string :title
      t.string :image
      t.text :content
      t.integer :status
      t.string :tour_id

      t.timestamps
    end
  end
end
