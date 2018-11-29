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
  def admin_logged_in?
    !current_admin.nil?
  end

  # Logs out the current user.
  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end
end
