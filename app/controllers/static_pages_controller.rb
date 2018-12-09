class StaticPagesController < ApplicationController
  def home
    if logged_in_customer?
      @job  = current_customer.jobs.build
      @feed_items = current_customer.feed.paginate(page: params[:page])
    end
  end

  def login
  end

  def application
  end

  def createaccount
  end

  def updateaccount
  end

  def updateworker
  end

  def userhome
  end

  def workerhome
  end

  def adminhome
  end

  def workerlogin
  end

  def adminlogin
  end

  def viewapplicants
  end

  def viewjobs
  end

  def invoice
  end

  def joblaunch
  end

  def jobrequest
  end

  def closejobs
  end
end
