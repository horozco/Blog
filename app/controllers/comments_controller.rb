class CommentsController < ApplicationController
  
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

end
