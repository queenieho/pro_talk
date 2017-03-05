class CreateJoinTableStoriesTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :stories, :tags do |t|
      t.index [:story_id, :tag_id]
      
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        drop_table :tags_users
      end
    end
  end
end
