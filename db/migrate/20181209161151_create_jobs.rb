class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :bedrooms
      t.text :fromAdress
      t.text :toAddress
      t.references :customer, foreign_key: true
      t.boolean :active, default: true
      t.text :worker

      t.timestamps
    end
    add_index :jobs, [:user_id, :created_at]
  end
end
