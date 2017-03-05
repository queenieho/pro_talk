class Gender < ApplicationRecord
<<<<<<< HEAD

  def to_json
    {
      id: id,
      icon: "#{ kind }.png",
      description: description
    }
  end
=======
>>>>>>> add migrations for categorized tags
end
