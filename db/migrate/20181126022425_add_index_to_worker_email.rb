class AddIndexToWorkerEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :workers, :email, unique: true
  end
end
