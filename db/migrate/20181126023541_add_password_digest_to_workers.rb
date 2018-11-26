class AddPasswordDigestToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :password_digest, :string
  end
end
