class ApplicantSessionsController < ApplicationController
  def new
  end

  def create
    applicant = Applicant.find_by(userName: params[:applicant_session][:userName])
    if applicant && applicant.authenticate(params[:applicant_session][:password])
      if applicant.activated?
        log_in applicant
        params[:session][:remember_me] == '1' ? remember(applicant) : forget(applicant)
        redirect_back_or applicant
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_applicant
    redirect_to root_url
  end
end
