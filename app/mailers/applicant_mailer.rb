class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.account_activation.subject
  #
  def applicant_account_activation(applicant)
    @applicant = applicant
    mail to: applicant.email, subject: "Helping Hands Application Account activation"
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.password_reset.subject
  #
  def applicant_password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
