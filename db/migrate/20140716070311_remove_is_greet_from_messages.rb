class RemoveIsGreetFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :is_greet
  end
end
