class CreateDetailAbouts < ActiveRecord::Migration
  def change
    create_table :detail_abouts do |t|
      t.string :name
      t.text :content
      t.integer :page_id

      t.timestamps
    end
  end
end
