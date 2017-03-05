class CreateAccessCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :access_codes do |t|
      t.string :email
      t.string :code
      t.boolean :expired, default: false
      t.boolean :applied, default: false

      t.timestamps
    end

    initial_access_codes = [
      {
        email: 'nuttmeg610@gmail.com',
        code: 'd7B9ejfoxq2Je'
      }
    ]
    initial_access_codes.each do |attributes|
      AccessCode.create!(attributes)
    end
  end
end
