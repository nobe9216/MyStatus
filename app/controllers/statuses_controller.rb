class StatusesController < ApplicationController
  before_action :authenticate_user!

  def new
    @status = Status.new
  end

  def create
    status = Status.new(status_params)
    status.user_id = current_user.id
    if status.save
      redirect_to user_statuses_path(params[:user_id])
    else
      redirect_to user_statuses_path(params[:user_id])
      flash[:notice] = '保存できませんでした 日付と体重は必ず記入してください'
    end
  end

  def index
    @user = User.find(params[:user_id])
    @statuses = Status.where(user_id: @user.id).order(date: :asc)
  end

  def show
    @user = User.find(params[:user_id])
    @status = Status.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @user = User.find(params[:user_id])
    @status = Status.find(params[:id])
  end

  def update
    status = Status.find(params[:id])
    status.update(status_params)
    redirect_to user_statuses_path(params[:user_id])
  end

  def destroy
    status = Status.find(params[:id])
    status.destroy
    redirect_to user_statuses_path
  end

  private

  def status_params
    params.require(:status).permit(:date, :weight, :fat, :breakfast, :lunch, :dinner, :snacks, :memo)
  end
end
