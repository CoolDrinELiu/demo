class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def edit
    @user = User.new
  end

  def update
  end

  def index
    @users = User.page(params[:page]).per(20)
  end

end
