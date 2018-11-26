class WorkersController < ApplicationController

  def show
    @worker = Worker.find(params[:id])
  end

  def new
  	@worker = Worker.new
  end
end