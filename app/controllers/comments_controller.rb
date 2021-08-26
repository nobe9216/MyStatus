class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @status = Status.find(params[:status_id])
    @comment = current_user.comments.new(comment_params)
    @comment.status_id = @status.id
    if @comment.save
      @comment = Comment.new
    end
    # redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:user_id])
    @status = Status.find(params[:status_id])
    @comment = Comment.new
    Comment.find_by(user_id: params[:user_id], status_id: params[:status_id], id: params[:id]).destroy
    # redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
