class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
