class PostsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create, :destroy, :edit, :update]
before_filter :authenticate_same_user, :only => [:update, :destroy, :edit]

  def authenticate_same_user
    @post = Post.find(params[:id])
      if current_user == @post.user
        true
      else
        redirect_to post_path(@post), :alert => "You are not authorized to edit this post"
        
      end
  end

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: ':) Post was created.'
      else
      flash[:error] = "There were some errors creating your post. :("
      render action: "new"
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
        redirect_to @post, notice: ':) Post was updated.'
    else
      flash[:error] = "There were some errors creating your post. :("
      render action: "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

end
