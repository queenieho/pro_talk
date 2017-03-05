class AddDefaultToStories < ActiveRecord::Migration[5.0]
  def change
    change_column :stories, :content, :text, default: ''
    change_column :stories, :title, :string, default: ''
  end
end
