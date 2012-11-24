class LikesController < ApplicationController
  
  before_filter :authenticate_user

  def authenticate_user
      if current_user
        true
      else
        redirect_to new_user_session_path(), :alert => "You are not authorized to like this comment"
      end
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @user = current_user
    @like = Like.new()
    @like.comment = @comment
    @like.user = @user
    if @like.save()
      redirect_to @like
    end
  end

  def destroy
    like = Like.find(params[:id]).destroy
  end
  
end
