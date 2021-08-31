class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    # ランキング機能用
    users = User.select(:id, :nickname, :sex, :age, :start_weight)
    ranking = []
    # https://techblog.lclco.com/entry/2019/07/31/180000
    users.find_each do |data|
      status = Status.order(date: :desc).where(user_id: data.id).first
      unless status.nil?
        ranking << {
          nickname: data.nickname,
          sex: data.sex,
          age: data.age,
          diff: status.weight - data.start_weight,
        }
      end
    end
    # https://qiita.com/zom/items/b22510a86ef63b18af00
    @ranking = ranking.sort { |a, b| a[:diff] <=> b[:diff] }

    @user = User.find(params[:id])
    @statuses = @user.statuses
    @chartlabels = @statuses.order(date: :asc).map { |status| status.date.strftime('%m/%d') }
    @weights = @statuses.order(date: :asc).map { |status| status.weight }
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
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :nickname,
      :profile_image,
      :start_weight,
      :goal_weight,
      :start_fat,
      :age,
      :height,
      :sex,
      :self_introduction,
    )
  end
end
