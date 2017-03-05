class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :religion, :string
    add_column :users, :verified, :boolean
    add_column :users, :surname, :string
    add_column :users, :username, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
