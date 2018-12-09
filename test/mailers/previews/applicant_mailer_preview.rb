# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/account_activation
  def account_activation
    applicant = Applicant.first
    applicant.activation_token = Applicant.new_token
    ApplicantMailer.applicant_account_activation(applicant)
  end

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/password_reset
  def password_reset
    ApplicantMailer.password_reset
  end

end
