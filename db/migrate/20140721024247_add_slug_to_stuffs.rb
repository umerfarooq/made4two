class AddSlugToStuffs < ActiveRecord::Migration
  def change
    add_column :stuffs, :slug, :string
    add_index :stuffs, :slug, unique: true
  end
end
