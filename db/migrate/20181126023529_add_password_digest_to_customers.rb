class AddPasswordDigestToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :pasword_digest, :string
  end
end
