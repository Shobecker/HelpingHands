class AccountActivationsController < ApplicationController

  def edit_applicant
    applicant = Application.find_by(email: params[:email])
    if applicant && !applicant.activated? && user.authenticated?(:activation, params[:id])
      applicant.activate
      log_in applicant
      flash[:success] = "Account activated!"
      redirect_to applicant
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

    def edit_customer
    customer = Customer.find_by(email: params[:email])
    if customer && !customer.activated?
      customer.activate
      log_in customer
      flash[:success] = "Account activated!"
      redirect_to customer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
