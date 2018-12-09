class AddResetToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :reset_digest, :string
    add_column :applicants, :reset_sent_at, :datetime
  end
end
