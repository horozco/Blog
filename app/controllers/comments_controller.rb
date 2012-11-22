class CommentsController < ApplicationController
  def create
    #a qué post le pertenece el comment?
    @post = Post.find(params[:post_id])
    if user_session = @post.user
      
    end
    @comment = @post.comments.create(params[:comment])
    
    if @comment.save
      redirect_to post_path(@post), :notice => "Your comment was submitted. :)"
    else
      redirect_to post_path(@post), :error => "Your comment couldn't be submitted. :("
    end
  end
end
