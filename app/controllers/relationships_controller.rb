class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

  def timeline
    user = current_user
    following_users = user.followings

    # フォローしているユーザーのidだけ抽出して配列に加える
    # following_users_id = []
    # following_users.each do |following_users|
    #   following_users_id << following_users.id
    # end

    # フォローしているユーザーのidと紐づく記録を抽出して配列に加える
    timeline = []
    # following_users_id.each do |following_user_id|
    following_users.ids.each do |following_user_id|
      # timeline_info = Status.where(user_id: following_user_id).order(date: :desc).limit(100)
      timeline_info = Status.where(user_id: following_user_id).limit(100)
      # timeline << timeline_info
      timeline += timeline_info
      # byebug
    end
    # byebug
    # timeline = Hash[*timeline]
    timeline = timeline.sort { |a, b| a[:date] <=> b[:date] }
    @timeline = timeline
    # byebug
  end
end
