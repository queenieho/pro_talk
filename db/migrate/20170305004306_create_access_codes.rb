class CreateAccessCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :access_codes do |t|
      t.string :email
      t.string :code
      t.boolean :expired, default: false
      t.boolean :applied, default: false

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        AccessCode.generate!('nuttmeg610@gmail.com')
      end
    end
  end
end
