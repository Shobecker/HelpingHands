class AddPasswordDigestToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :pasword_digest, :string
  end
end
