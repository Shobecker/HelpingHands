class StaticPagesController < ApplicationController



  def home
    if logged_in_customer?
      @job  = current_customer.jobs.build
      @feed_items = current_customer.feed.paginate(page: params[:page])
    end
  end

end
