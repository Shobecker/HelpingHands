class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(username: params[:admin_session][:username])
    if admin && admin.authenticate(params[:admin_session][:password])
      # Log the admin in and redirect to the admin's show page.
      log_in_admin admin
      redirect_to admin
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out_admin
    redirect_to root_url
  end
end
