class AddColumnToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :contact, :boolean
  end
end
