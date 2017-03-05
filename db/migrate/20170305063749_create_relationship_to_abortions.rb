class CreateRelationshipToAbortions < ActiveRecord::Migration[5.0]
  def change
    create_table :relationship_to_abortions do |t|
      t.string :description
      t.string :kind

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        relationships = [
          { kind: 'personal', description: 'I got an abortion' },
          { kind: 'friend', description: 'Someone I know got an abortion' },
          { kind: 'wondering',
            description: "I'm wondering whether I should get an abortion" },
          { kind: 'personal-parent',
            description: 'I have kids and I got an abortion' }
        ]

        relationships.each do |attributes|
          RelationshipToAbortion.create!(attributes)
        end
      end
    end
  end
end
