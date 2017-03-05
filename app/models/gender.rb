class Gender < ApplicationRecord
  def to_json
    {
      id: id,
      icon: "#{ kind }.png",
      description: description
    }
  end
end
