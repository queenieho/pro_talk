class AddCodeOfConductToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :agrees_to_code_of_conduct, :boolean, default: false
  end
end
