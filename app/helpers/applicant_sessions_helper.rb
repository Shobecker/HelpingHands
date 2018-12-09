module ApplicantSessionsHelper
	# Logs in the given applicant.
  def log_in_applicant(applicant)
    session[:applicant_id] = applicant.id
  end

  # Returns true if the applicant is logged in, false otherwise.
  def logged_in_applicant?
    !current_applicant.nil?
  end

  # Logs out the current applicant.
  def log_out_applicant
    current_applicant && forget_applicant(current_applicant)
    session.delete(:applicant_id)
    @current_applicant = nil
  end

  # Returns true if the given applicant is the current applicant.
  def current_applicant?(applicant)
    applicant == current_applicant
  end

  #Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  # Remembers a applicant in a persistent session.
  def remember(applicant)
    applicant.remember
    cookies.permanent.signed[:applicant_id] = applicant.id
    cookies.permanent[:remember_token] = applicant.remember_token
  end

  # Returns the current logged-in applicant (if any).
  def current_applicant
    if (applicant_id = session[:applicant_id])
      @current_applicant ||= Applicant.find_by(id: applicant_id)
    elsif (applicant_id = cookies.signed[:applicant_id])
      applicant = Applicant.find_by(id: applicant_id)
      if applicant && applicant.authenticated?(:remember, cookies[:remember_token])
        log_in_applicant applicant
        @current_applicant = applicant
      end
    end
  end

  # Forgets a persistent session.
  def forget_applicant(applicant)
    #applicant.forget_applicant
    cookies.delete(:applicant_id)
    cookies.delete(:remember_token)
  end
end
