class CreateGetInTouches < ActiveRecord::Migration
  def change
    create_table :get_in_touches do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
