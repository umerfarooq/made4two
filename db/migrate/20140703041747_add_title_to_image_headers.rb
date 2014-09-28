class AddTitleToImageHeaders < ActiveRecord::Migration
  def change
    add_column :image_headers, :title, :string
  end
end
