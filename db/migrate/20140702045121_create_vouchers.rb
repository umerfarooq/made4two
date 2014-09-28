class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :code
      t.integer :user_id
      t.integer :discount

      t.timestamps
    end
  end
end
