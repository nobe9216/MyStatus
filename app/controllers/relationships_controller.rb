class RelationshipsController < ApplicationController
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
    following_users_id = []
    following_users.each do |following_users|
      following_users_id << following_users.id
    end
    timeline = []
    following_users_id.each do |following_user_id|
      # timeline_info = Status.where(user_id: following_user_id).order(date: :desc).limit(100)
      timeline_info = Status.where(user_id: following_user_id).limit(100)
      timeline << timeline_info
    end
    @timeline = timeline
    # byebug
  end
end
