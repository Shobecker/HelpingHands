class WorkersController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
  end

  def new
  	@worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      flash[:success] = "Worker Account Created"
      redirect_to @worker
    else
      render 'new'
    end
  end

  private

    def worker_params
      params.require(:worker).permit(:firstName, :email, :userName, :password,
                                   :password_confirmation)
    end
end