class CreateImageHeaders < ActiveRecord::Migration
  def change
    create_table :image_headers do |t|
      t.text :description
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
