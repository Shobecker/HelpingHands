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
  def customer_logged_in?
    !current_customer.nil?
  end

  # Logs out the current user.
  def log_out_customer
    session.delete(:customer_id)
    @current_customer = nil
  end
end
