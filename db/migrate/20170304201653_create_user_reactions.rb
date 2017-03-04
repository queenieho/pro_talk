class CreateUserReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reactions do |t|

      t.timestamps
    end

    add_reference :user_reactions, :story, foreign_key: true
    add_reference :user_reactions, :user, foreign_key: true
    add_reference :user_reactions, :reaction, foreign_key: true
  end
end
