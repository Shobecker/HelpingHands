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
  def worker_logged_in?
    !current_worker.nil?
  end

# Logs out the current user.
  def log_out_worker
    session.delete(:worker_id)
    @current_worker = nil
  end
end
