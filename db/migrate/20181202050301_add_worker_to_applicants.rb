class AddWorkerToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :worker, :boolean, default: false
  end
end
