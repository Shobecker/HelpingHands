class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def new
  	@customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "Welcome to Helping Hands!"
      redirect_to @customer
    else
      render 'new'
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:firstName, :email, :userName, :password,
                                   :password_confirmation)
    end
end