class AddPasswordDigestToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :pasword_digest, :string
  end
end
