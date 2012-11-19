class CommentsController < ApplicationController
  def create
    #a qué post le pertenece el comment?
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
end
