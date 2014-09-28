class AddAdvancedDescriptionToTours < ActiveRecord::Migration
  def change
    add_column :tours, :we_love_id, :integer
    add_column :tours, :merchant, :string
    add_column :tours, :availability, :string
    add_column :tours, :blackout_date, :string
    add_column :tours, :duration, :string
    add_column :tours, :experience_location, :string
    add_column :tours, :nearest_airport, :string
    add_column :tours, :include_id, :integer
    add_column :tours, :maps, :string
  end
end
