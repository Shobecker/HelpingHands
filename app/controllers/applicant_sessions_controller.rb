class ApplicantSessionsController < ApplicationController
  
  def new
  end

  def create
    applicant = Applicant.find_by(userName: params[:applicant_session][:userName].downcase)
    if applicant && applicant.authenticate(params[:applicant_session][:password])
      if applicant.activated?
        log_in_applicant applicant
        params[:applicant_session][:remember_me] == '1' ? remember(applicant) : forget_applicant(applicant)
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
    log_out_applicant if logged_in_applicant?
    redirect_to root_url
  end
end
