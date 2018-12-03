class AdminsController < ApplicationController

  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  before_action :correct_admin,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @admin = Admin.paginate(page: params[:page])
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "admin Account Created"
      redirect_to @admin
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end

    def destroy
    Admin.find(params[:id]).destroy
    flash[:success] = "Admin deleted"
    redirect_to admins_url
  end

  private

  # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_admin?
    end

    def admin_params
      params.require(:admin).permit(:username, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in admin.
    def logged_in_admin
      unless logged_in_admin?
        store_location
        flash[:danger] = "Please log in."
        redirect_to loginadmin_url
      end
    end

    # Confirms the admin worker.
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end
end