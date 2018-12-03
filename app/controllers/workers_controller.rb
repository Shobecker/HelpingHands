class WorkersController < ApplicationController

  before_action :logged_in_worker, only: [:index, :edit, :update, :destroy]
  before_action :correct_worker,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @worker = Worker.paginate(page: params[:page])
  end

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

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(worker_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @worker
    else
      render 'edit'
    end
  end

  def destroy
    Worker.find(params[:id]).destroy
    flash[:success] = "Worker deleted"
    redirect_to workers_url
  end

  private
  
      # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_admin?
    end

    def worker_params
      params.require(:worker).permit(:firstName, :email, :userName, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in customer.
    def logged_in_worker
      unless logged_in_worker?
        store_location
        flash[:danger] = "Please log in."
        redirect_to loginworker_url
      end
    end

    # Confirms the correct worker.
    def correct_worker
      @worker = Worker.find(params[:id])
      redirect_to(root_url) unless current_worker?(@worker)
    end
end