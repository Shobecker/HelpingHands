class ApplicantPasswordResetsController < ApplicationController
  before_action :get_applicant,         only: [:edit, :update]
  before_action :valid_applicant,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    @applicant = Applicant.find_by(email: params[:password_reset][:email].downcase)
    if @applicant
      @applicant.create_reset_digest
      @applicant.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:applicant][:password].empty?                  # Case (3)
      @applicant.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @applicant.update_attributes(applicant_params)          # Case (4)
      log_in_applicant @applicant
      flash[:success] = "Password has been reset."
      redirect_to @applicant
    else
      render 'edit'                                     # Case (2)
    end
  end

  private

    def applicant_params
      params.require(:applicant).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_applicant
      @applicant = Applicant.find_by(email: params[:email])
    end

    # Confirms a valid applicant.
    def valid_applicant
      unless (@applicant && @applicant.activated? &&
              @applicant.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @applicant.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
