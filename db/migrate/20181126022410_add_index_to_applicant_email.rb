class AddIndexToApplicantEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :applicants, :email, unique: true
  end
end
