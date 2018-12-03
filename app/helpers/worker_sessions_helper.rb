module WorkerSessionsHelper
	# Logs in the given worker.
  def log_in_worker(worker)
    session[:worker_id] = worker.id
  end

  # Returns the current logged-in worker (if any).
  def current_worker
    if session[:worker_id]
      @current_worker ||= Worker.find_by(id: session[:worker_id])
    end
  end

  # Returns true if the worker is logged in, false otherwise.
  def logged_in_worker?
    !current_worker.nil?
  end

# Logs out the current worker.
  def log_out_worker
    session.delete(:worker_id)
    @current_worker = nil
  end

  # Returns true if the given user is the current worker.
  def current_worker?(worker)
    worker == current_worker
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
end
