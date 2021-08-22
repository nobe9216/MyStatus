class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses
    @chartlabels = @statuses.order(date: :asc).map {|status| status.date.strftime('%m/%d') }
    @weights = @statuses.order(date: :asc).map {|status| status.weight }
    if @statuses.present?
      @last_weight = @statuses.order(date: :asc).last.weight
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def unsubscribe
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :profile_image, :start_weight, :goal_weight, :start_fat, :age, :height, :sex, :self_introduction)
  end
end
