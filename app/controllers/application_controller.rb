class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CustomerSessionsHelper
  include WorkerSessionsHelper
  include AdminSessionsHelper
  include ApplicantSessionsHelper

  private
    # Confirms a logged-in customer.
    def logged_in_customer
      unless logged_in_customer?
        store_location
        flash[:danger] = "Please log in."
        redirect_to logincustomer_url
      end
    end
end
