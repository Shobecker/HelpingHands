class CustomersController < ApplicationController

  before_action :logged_in_customer, only: [:index, :edit, :update, :destroy]
  before_action :correct_customer,   only: [:edit, :update]
  #before_action :admin_customer,     only: :destroy
  
  def index
    @customer = Customer.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @jobs = @customer.jobs.paginate(page: params[:page])
  end

  def new
  	@customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      CustomerMailer.account_activation(@customer).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_url
  end

  private

  # Confirms an admin customer.
    #def admin_user
      #redirect_to(root_url) unless current_admin?
    #end

    def customer_params
      params.require(:customer).permit(:firstName, :lastName, :email, :address, :creditCard, 
        :creditExpDate, :securityCode, :phone, :userName, :password,
                                   :password_confirmation)
    end

     # Before filters

     # Confirms a logged-in customer. (MOVED TO APPLICATION_CONTROLLER)
    #def logged_in_customer
      #unless logged_in_customer?
        #store_location
        #flash[:danger] = "Please log in."
        #redirect_to logincustomer_url
      #end
    #end

    # Confirms the correct customer.
    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(root_url) unless current_customer?(@customer)
    end
end