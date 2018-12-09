class AddResetToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :reset_digest, :string
  end
end
