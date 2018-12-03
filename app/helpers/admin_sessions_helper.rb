module AdminSessionsHelper
	# Logs in the given admin.
  def log_in_admin(admin)
    session[:admin_id] = admin.id
  end

  # Returns the current logged-in admin (if any).
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  # Returns true if the admin is logged in, false otherwise.
  def logged_in_admin?
    !current_admin.nil?
  end

  # Logs out the current admin.
  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  # Returns true if the given admin is the current admin.
  def current_admin?(admin)
    admin == current_admin
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


  # Remembers a admin in a persistent session.
  def remember(admin)
    admin.remember
    cookies.permanent.signed[:user_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

# Returns the current logged-in admin (if any).
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end
end