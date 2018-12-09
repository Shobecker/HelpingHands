class CustomerSessionsController < ApplicationController
  
  def new
  end

  def create
    customer = Customer.find_by(userName: params[:session][:userName].downcase)
    if customer && customer.authenticate(params[:session][:password])
      if customer.activated?
        log_in customer
        params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
        redirect_back_or customer
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_customer if logged_in_customer?
    redirect_to root_url
  end
end
