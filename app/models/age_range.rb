class AgeRange < ApplicationRecord
  def icon_path
    "tag_icons/#{ self.class.name.underscore }/#{ kind }.png"
  end

  def to_json
    {
      id: id,
      icon: icon_path,
      description: description
    }
  end
end
