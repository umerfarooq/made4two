class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :tour_id
      t.integer :user_id

      t.timestamps
    end
  end
end
