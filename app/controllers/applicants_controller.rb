class ApplicantsController < ApplicationController

  def show
    @applicant = Applicant.find(params[:id])
  end

  def new
  	@applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      flash[:success] = "Thank you for Applying!"
      redirect_to @applicant
    else
      render 'new'
    end
  end

  private

    def applicant_params
      params.require(:applicant).permit(:firstName, :email, :userName, :password,
                                   :password_confirmation)
    end
end