class CustomerSessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(userName: params[:customer_session][:userName].downcase)
    if customer && customer.authenticate(params[:customer_session][:password])
      # Log the customer in and redirect to the customer's show page.
      log_in_customer customer
      redirect_to customer
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out_customer
    redirect_to root_url
  end
end
