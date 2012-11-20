class PostsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create, :destroy]

    def index
    @posts = Post.order("created_at DESC")
    #@posts = Post.all
    #ordenar los post
    #@posts.sort!{ |x,y| y.updated_at <=>x.updated_at}
    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: ':) Post was created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

#  def sort
#    @posts = Post.all
#  end

end
