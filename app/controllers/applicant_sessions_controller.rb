class ApplicantSessionsController < ApplicationController
  def new
  end

  def create
    applicant = Applicant.find_by(userName: params[:applicant_session][:userName])
    if applicant && applicant.authenticate(params[:applicant_session][:password])
      # Log the applicant in and redirect to the applicant's show page.
      log_in_applicant applicant
      redirect_to applicant
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out_applicant
    redirect_to root_url
  end
end
