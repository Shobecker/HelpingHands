class JobsController < ApplicationController

before_action :logged_in_customer, only: [:create, :destroy, :edit]
before_action :correct_customer,   only: :destroy, :edit

  def create
  	@job = current_customer.jobs.build(job_params)
    if @job.save
      flash[:success] = "Job created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @job.destroy
    flash[:success] = "Job deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    
  end

  def update
  end

  private

   def job_params
      params.require(:job).permit(:bedrooms, :toAddress, :fromAdress)
   end

   def correct_customer
      @job = current_customer.jobs.find_by(id: params[:id])
      redirect_to root_url if @job.nil?
    end
end
