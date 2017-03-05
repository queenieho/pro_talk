class AgeRange < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
=======
>>>>>>> 7ddd145c9301bc0a2bd79734dd3cbe7cab1a845b

  def to_json
    {
      id: id,
      icon: "#{ kind }.png",
      description: description
    }
  end
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add migrations for categorized tags
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
=======
>>>>>>> 7ddd145c9301bc0a2bd79734dd3cbe7cab1a845b
end
