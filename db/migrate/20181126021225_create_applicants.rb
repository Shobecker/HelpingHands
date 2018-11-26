class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :firstName
      t.string :lastName
      t.string :vehicle
      t.string :license
      t.datetime :birthday
      t.string :email
      t.string :address
      t.string :bankaccount
      t.string :bankrouting
      t.string :phone
      t.string :userName

      t.timestamps
    end
  end
end
