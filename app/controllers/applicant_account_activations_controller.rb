class ApplicantAccountActivationsController < ApplicationController

   def edit
    applicant = Applicant.find_by(email: params[:email])
    if applicant && !applicant.activated? && applicant.authenticated?(:activation, params[:id])
      applicant.activate
      log_in_applicant applicant
      flash[:success] = "Account activated!"
      redirect_to applicant
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
