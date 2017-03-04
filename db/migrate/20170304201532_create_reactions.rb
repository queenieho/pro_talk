class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.boolean :visible, default: false
      t.string :kind
      t.string :phrase

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        seed_reactions = [
          {
            kind: 'support',
            phrase: 'I support you'
          },
          {
            kind: 'hug',
            phrase: "I'm sending you a virtual hug"
          },
          {
            kind: 'reachout',
            phrase: "I'd love to reach out to you personally"
          }
        ]
        seed_reactions.each do |attributes|
          Reaction.create!(attributes)
        end
      end
    end
  end
end
