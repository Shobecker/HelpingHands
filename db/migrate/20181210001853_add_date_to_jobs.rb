class AddDateToJobs < ActiveRecord::Migration[5.1]
  def change
  	add_column :jobs, :date, :text
  end
end
