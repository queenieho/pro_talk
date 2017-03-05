class CreateRelationshipToAbortions < ActiveRecord::Migration[5.0]
  def change
    create_table :relationship_to_abortions do |t|

      t.timestamps
    end
  end
end
