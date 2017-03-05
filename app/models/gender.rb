class Gender < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data

  def to_json
    {
      id: id,
      icon: "#{ kind }.png",
      description: description
    }
  end
<<<<<<< HEAD
=======
>>>>>>> add migrations for categorized tags
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
end
