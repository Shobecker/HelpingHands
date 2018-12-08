class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.text :content
      t.references :customer, foreign_key: true

      t.timestamps
    end
    add_index :jobs, [:customer_id, :created_at]
  end
end
