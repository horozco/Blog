class CommentsController < ApplicationController

  before_filter :authenticate_user, :only => [:destroy]

  def authenticate_user
    @post = Post.find(params[:post_id])
      if current_user == @post.user
        true
      else
        redirect_to post_path(@post), :alert => "You are not authorized to delete this comment"
      end
  end

  def create
    #a qué post le pertenece el comment?
    @post = Post.find(params[:post_id])
    if current_user
      @comment = @post.user_comments.build(params[:comment])
      @comment.user = current_user
    else
      @comment = @post.anonymous_comments.build(params[:comment])
    end
    
    if @comment.save
      CommentMailer.new_comment_notify(@post).deliver  
      respond_to do |format|
        format.html {redirect_to post_path(@post), :notice => "Your comment was submitted. :)"}
        format.js
      end
    else
      respond_to do |format|
        format.html {redirect_to post_path(@post), :alert => "Your comment couldn't be submitted. :("}
        format.js
      end
    end 
  end 

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html {redirect_to post_path(@post), :notice => "Your comment was deleted"}
        format.js
    end

  end
  
end
