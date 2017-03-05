class CreateDefaultTags < ActiveRecord::Migration[5.0]
  TAG_NAMES = [
    'LGBTQ',
    'Planned pregnancy',
    'Unplanned pregnancy',
    'Partner perspective',
    'Complications',
    'Financial Support'
  ]

  def up
    TAG_NAMES.each do |tag|
      Tag.create!(name: tag)
    end
  end

  def down
    Tag.where(name: TAG_NAMES).destroy_all
  end
end
