class UsersController < ApplicationController
  before_action :set_user,only: [:edit, :update]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end
    
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:info] = "プロフィールを変更しました"
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to user_path
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:live_place)
  end
  
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end
