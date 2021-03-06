class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.account_activation.subject
  #
  def customer_account_activation(customer)
    @customer = customer
    mail to: @customer.email, subject: "Helping Hands Account activation"
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.password_reset.subject
  #
  def customer_password_reset (customer)
    @customer = customer
    mail to: customer.email, subject: "Password reset"
  end
end
