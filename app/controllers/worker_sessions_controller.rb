class WorkerSessionsController < ApplicationController
  def new
  end

  def create
    worker = Worker.find_by(userName: params[:worker_session][:userName])
    if worker && worker.authenticate(params[:worker_session][:password])
      # Log the worker in and redirect to the worker's show page.
      log_in_worker worker
      redirect_to worker
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out_worker
    redirect_to root_url
  end
end
