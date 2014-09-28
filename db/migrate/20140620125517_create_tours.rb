class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.string :location
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
