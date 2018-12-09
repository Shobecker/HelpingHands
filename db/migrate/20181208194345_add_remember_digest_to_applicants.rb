class AddRememberDigestToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :remember_digest, :string
  end
end
