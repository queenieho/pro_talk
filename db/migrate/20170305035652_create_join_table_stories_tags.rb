class CreateJoinTableStoriesTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :stories, :tags do |t|
      t.index [:story_id, :tag_id]
      
      t.timestamps
    end
  end
end
