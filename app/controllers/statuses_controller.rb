class StatusesController < ApplicationController
  before_action :authenticate_user!

  def new
    @status = Status.new
  end

  def create
    status = Status.new(status_params)
    status.user_id = current_user.id
    status.save
    redirect_to statuses_path(params[:user_id])
  end

  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    status = Status.find(params[:id])
    status.update(status_params)
    redirect_to statuses_path(params[:user_id])
  end

  private

  def status_params
    params.require(:status).permit(:date, :weight, :fat, :breakfast, :lunch, :dinner, :snacks, :memo)
  end
end
