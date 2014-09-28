class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :subject
      t.string :address1
      t.string :address2
      t.text :message
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
