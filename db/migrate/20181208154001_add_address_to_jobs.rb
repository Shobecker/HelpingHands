class AddAddressToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :ToAdress, :text
    add_column :jobs, :FromAddress, :text
  end
end
