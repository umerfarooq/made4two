class AddGreetToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :is_greet, :boolean
    add_column :messages, :email, :string
  end
end
