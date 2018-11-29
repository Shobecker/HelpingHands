module ApplicantSessionsHelper
	# Logs in the given applicant.
  def log_in_applicant(applicant)
    session[:applicant_id] = applicant.id
  end

  # Returns the current logged-in applicant (if any).
  def current_applicant
    if session[:applicant_id]
      @current_applicant ||= Applicant.find_by(id: session[:applicant_id])
    end
  end

  # Returns true if the applicant is logged in, false otherwise.
  def applicant_logged_in?
    !current_applicant.nil?
  end

  # Logs out the current user.
  def log_out_applicant
    session.delete(:applicant_id)
    @current_applicant = nil
  end
end
