class CreateIncludes < ActiveRecord::Migration
  def change
    create_table :includes do |t|
      t.string :description
      t.integer :tour_id

      t.timestamps
    end
  end
end
