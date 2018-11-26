class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :address
      t.string :creditCard
      t.integer :creditExpDate
      t.string :securityCode
      t.string :phone
      t.string :userName

      t.timestamps
    end
  end
end
