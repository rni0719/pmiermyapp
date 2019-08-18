class PostsController < ApplicationController
  before_action :authenticate_user!
  def create
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id
    if @newpost.save
      redirect_to post_path(@newpost)
    else
      render posts_path
    end
  end
  
  def index
    @newpost = Post.new
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @newpost = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
		if @post.user != current_user
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render posts_path
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
