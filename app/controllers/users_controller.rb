class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @newpost = Post.new
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @newpost = Post.new
    @posts = Post.where(user_id: @user)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render users_path
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:introduction, :name)
  end
end
