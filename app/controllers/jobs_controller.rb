class JobsController < ApplicationController

before_action :logged_in_user, only: [:create]
  
  def create
  	@job = current_customer.jobs.build(job_params)
    if @job.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

   def micropost_params
      params.require(:job).permit(:content)
   end
end
