class ApplicantsController < ApplicationController

  before_action :logged_in_applicant, only: [:index, :edit, :update]
  before_action :correct_applicant,   only: [:edit, :update]
  #before_action :admin_user,     only: :destroy

  def index
    @applicant = Applicant.paginate(page: params[:page])
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      @applicant.send_activation_email
      flash[:info] = "Thank you for Applying, Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update_attributes(applicant_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @applicant
    else
      render 'edit'
    end
  end

  def destroy
    Applicant.find(params[:id]).destroy
    flash[:success] = "Applicant deleted"
    redirect_to applicants_url
  end

  def hire
    @applicant.update(worker: true)
  end

  private

    def applicant_params
      params.require(:applicant).permit(:firstName, :lastName, :vehicle, :license, :birthday,
       :email, :address, :bankaccount, :bankrouting, :phone, :userName, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in applicant.
    def logged_in_applicant
      unless logged_in_applicant? || 
        store_location
        flash[:danger] = "Please log in."
        redirect_to loginapplicant_url
      end
    end

    # Confirms the correct applicant.
    def correct_applicant
     @applicant = Applicant.find(params[:id])
      if !current_admin?(@admin)
      redirect_to(root_url)
      elsif !current_applicant?(@applicant)
      redirect_to(root_url)
      end
    end

    # Confirms the admin
    #def admin_user
     #redirect_to(root_url) unless current_admin(@admin)?
   #end
end