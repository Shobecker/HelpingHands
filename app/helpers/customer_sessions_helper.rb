module CustomerSessionsHelper
  # Logs in the given customer.
  def log_in_customer(customer)
    session[:customer_id] = customer.id
  end

	# Returns the current logged-in customer (if any).
  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end

  # Returns true if the customer is logged in, false otherwise.
  def logged_in_customer?
    !current_customer.nil?
  end

  # Logs out the current customer.
  def log_out_customer
    session.delete(:customer_id)
    @current_customer = nil
  end

  # Returns true if the given customer is the current customer.
  def current_customer?(customer)
    customer == current_customer
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
  
  # Remembers a customer in a persistent session.
  def remember(customer)
    customer.remember
    cookies.permanent.signed[:customer_id] = customer.id
    cookies.permanent[:remember_token] = customer.remember_token
  end

  # Returns the current logged-in admin (if any).
  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end
end
