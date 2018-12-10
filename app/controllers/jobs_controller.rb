class JobsController < ApplicationController

before_action :logged_in_customer, only: :create
#before_action :correct_customer, only: [:destroy, :edit]
  
  def index
    @job  = Job.paginate(page: params[:page])
    #@feed_items = customer.feed.paginate(page: params[:page])
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end


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

  def add_activation
    @job = Job.find(params[:id])
    @job.activate = 'true'
    save
  end

  private

   def job_params
      params.require(:job).permit(:bedrooms, :toAddress, :fromAdress, :date)
   end

   def correct_customer
      @job = current_customer.jobs.find_by(id: params[:id])
      redirect_to root_url if @job.nil?
    end
end
