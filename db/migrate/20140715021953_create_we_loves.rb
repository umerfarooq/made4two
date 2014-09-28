class CreateWeLoves < ActiveRecord::Migration
  def change
    create_table :we_loves do |t|
      t.string :description
      t.integer :tour_id

      t.timestamps
    end
  end
end
