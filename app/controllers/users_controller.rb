class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
    @microposts = @user.microposts.page(params[:page]).per(8)
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
