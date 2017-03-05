class AddTagOptionsToStories < ActiveRecord::Migration[5.0]
  def change
    add_reference :stories, :age_range
    add_reference :stories, :gender
    add_reference :stories, :relationship_to_abortion
  end
end
