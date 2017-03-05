class CreateAgeRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :age_ranges do |t|
<<<<<<< HEAD
<<<<<<< HEAD
      t.string :description
      t.string :kind
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ranges = [
          { kind: 'eleven-below', description: '<11'},
          { kind: 'tens', description: '11-19'},
          { kind: 'twenties', description: '20-29'},
          { kind: 'thirties', description: '30-39'},
          { kind: 'forties', description: '40-49'},
          { kind: 'fifty-above', description: '50+'}
        ]
        ranges.each do |attributes|
          AgeRange.create!(attributes)
        end
      end
=======

=======
      t.string :description
      t.string :kind
>>>>>>> add gender, relationship to abortion, and age range to story as possible options; add to_json for serializing data
      t.timestamps
>>>>>>> add migrations for categorized tags
    end

    reversible do |dir|
      dir.up do
        ranges = [
          { kind: 'eleven-below', description: '<11'},
          { kind: 'tens', description: '11-19'},
          { kind: 'twenties', description: '20-29'},
          { kind: 'thirties', description: '30-39'},
          { kind: 'forties', description: '40-49'},
          { kind: 'fifty-above', description: '50+'}
        ]
        ranges.each do |attributes|
          AgeRange.create!(attributes)
        end
      end
    end
  end
end
