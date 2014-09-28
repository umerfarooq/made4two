class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.string :name
      t.string :type
      t.integer :status

      t.timestamps
    end
  end
end
