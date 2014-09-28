class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :latitude
      t.string :longitude
      t.string :location
      t.string :location_type
      t.string :formatted_address
      t.string :bounds
      t.string :viewport
      t.string :route
      t.integer :street_number
      t.integer :postal_code
      t.string :locality
      t.string :sub_locality
      t.string :country
      t.string :country_code
      t.string :state
      t.string :code
      t.string :url
      t.string :website

      t.timestamps
    end
  end
end
