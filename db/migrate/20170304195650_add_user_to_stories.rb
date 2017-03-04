class AddUserToStories < ActiveRecord::Migration[5.0]
  def change
    add_reference :stories, :user, foreign_key: true
  end
end
