class CreateGenders < ActiveRecord::Migration[5.0]
  def change
    create_table :genders do |t|
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
      t.string :description
      t.string :kind

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        genders = [
          {kind: 'female', description: 'Female'},
          {kind: 'male', description: 'Male'},
          {kind: 'bigender', description: 'Bi-Gender'},
          {kind: 'transgender', description: 'Transgender'},
          {kind: 'genderqueer', description: 'Genderqueer / Non-Binary'},
        ]

        genders.each do |attributes|
          Gender.create!(attributes)
        end
      end
    end
<<<<<<< HEAD
=======

      t.timestamps
    end
>>>>>>> add migrations for categorized tags
=======
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
  end
end
